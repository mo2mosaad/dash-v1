<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\ClientPoRequest;
use App\Http\Requests\UpdateClientPoRequest;
use App\Models\ClientPo;
use App\Models\Service;
use App\Models\Task;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Throwable;

class ClientPoController extends Controller
{
    public function index(Task $task)
    {
        Gate::authorize('View Client PO');

        $clientPos = ClientPo::query()
            ->with(['media', 'services', 'client', 'task'])
            ->where('task_code', $task->task_number)
            ->latest()
            ->paginate(10)
            ->withQueryString();

        return view('dashboard.tasks.client-pos.index', compact('task', 'clientPos'));
    }

    public function create(Task $task)
    {
        Gate::authorize('Create Client PO');

        $services = Service::query()
            ->where('status', 'active')
            ->orderBy('name')
            ->get();

        return view('dashboard.tasks.client-pos.create', compact('task', 'services'));
    }

    public function store(ClientPoRequest $request, Task $task)
    {
        Gate::authorize('Create Client PO');

        $validated = $request->validated();

        try {
            DB::transaction(function () use ($validated, $task, $request) {
                $clientPo = ClientPo::create([
                    'task_code' => $task->task_number,
                    'client_code' => $validated['client_code'],
                    'date_20' => $validated['date_20'],
                    'date_80' => $validated['date_80'],
                    'payment_20' => $validated['payment_20'],
                    'payment_80' => $validated['payment_80'],
                    'total_price' => $validated['total_price'],
                    'status' => 'pending',
                ]);

                $clientPo->services()->sync($validated['service_ids'] ?? []);

                $this->storePoMedia($clientPo, $request->file('po_file'), $validated['note'] ?? null, 'client-pos');

            });

            if ($request->wantsJson() || $request->ajax()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Client PO created successfully.',
                    'redirect' => route('dashboard.tasks.client-pos.index', $task),
                ]);
            }

            return redirect()
                ->route('dashboard.tasks.client-pos.index', $task)
                ->with('success', 'Client PO created successfully.');
        } catch (Throwable $e) {
            if ($request->wantsJson() || $request->ajax()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Failed to create Client PO. Please try again.',
                    'errors' => ['po_file' => 'Failed to create Client PO. Please try again.'],
                ], 500);
            }

            return redirect()
                ->back()
                ->withInput()
                ->with('error', 'Failed to create Client PO. Please try again.');
        }
    }

    public function edit(Task $task, ClientPo $clientPo)
    {
        Gate::authorize('Update Client PO');

        abort_unless($clientPo->task_code === $task->task_number, 404);

        $services = Service::query()
            ->where('status', 'active')
            ->orderBy('name')
            ->get();

        return view('dashboard.tasks.client-pos.edit', compact('task', 'clientPo', 'services'));
    }

    public function update(UpdateClientPoRequest $request, Task $task, ClientPo $clientPo)
    {
        Gate::authorize('Update Client PO');

        abort_unless($clientPo->task_code === $task->task_number, 404);

        $validated = $request->validated();

        DB::transaction(function () use ($clientPo, $validated, $request) {
            $clientPo->update([
                'client_code' => $validated['client_code'],
                'date_20' => $validated['date_20'],
                'date_80' => $validated['date_80'],
                'payment_20' => $validated['payment_20'],
                'payment_80' => $validated['payment_80'],
                'total_price' => $validated['total_price'],
                'status' => $clientPo->status,
            ]);

            $clientPo->services()->sync($validated['service_ids'] ?? []);

            if ($request->hasFile('po_file')) {
                $this->storePoMedia($clientPo, $request->file('po_file'), $validated['note'] ?? null, 'client-pos');
            } elseif (array_key_exists('note', $validated) && $clientPo->media) {
                $clientPo->media()->update(['note' => $validated['note']]);
            }
        });

        if ($request->wantsJson() || $request->ajax()) {
            return response()->json([
                'success' => true,
                'message' => 'Client PO updated successfully.',
                'redirect' => route('dashboard.tasks.client-pos.index', $task),
            ]);
        }

        return redirect()
            ->route('dashboard.tasks.client-pos.index', $task)
            ->with('success', 'Client PO updated successfully.');
    }

    public function download(Task $task, ClientPo $clientPo)
    {
        Gate::authorize('Download Client PO');

        abort_unless($clientPo->task_code === $task->task_number, 404);

        $media = $clientPo->media;
        abort_if(! $media || ! Storage::disk('uploads')->exists($media->path), 404);

        return response()->download(Storage::disk('uploads')->path($media->path), $media->original_name);
    }

    public function destroyFile(Task $task, ClientPo $clientPo)
    {
        Gate::authorize('Update Client PO');

        abort_unless($clientPo->task_code === $task->task_number, 404);

        $this->deleteExistingMedia($clientPo);

        return redirect()
            ->route('dashboard.tasks.client-pos.index', $task)
            ->with('success', 'PO file deleted successfully. You can upload a new PDF now.');
    }

    public function destroy(Task $task, ClientPo $clientPo)
    {
        Gate::authorize('Delete Client PO');

        abort_unless($clientPo->task_code === $task->task_number, 404);

        DB::transaction(function () use ($clientPo) {
            // Detach related services
            $clientPo->services()->detach();

            // Delete all media files (single and multiple) from storage and DB
            $disk = Storage::disk('uploads');

            $clientPo->mediaFiles->each(function ($media) use ($disk) {
                if ($media->path && $disk->exists($media->path)) {
                    $disk->delete($media->path);
                }
                $media->delete();
            });

            if ($clientPo->media) {
                if ($clientPo->media->path && $disk->exists($clientPo->media->path)) {
                    $disk->delete($clientPo->media->path);
                }
                $clientPo->media->delete();
            }

            $clientPo->delete();
        });

        return redirect()
            ->route('dashboard.tasks.client-pos.index', $task)
            ->with('success', 'Client PO and its files deleted successfully.');
    }

    protected function storePoMedia(ClientPo $po, UploadedFile $file, ?string $note, string $directory): void
    {
        if ($po->media) {
            $this->deleteExistingMedia($po);
        }

        $filename = Str::uuid() . '.' . $file->getClientOriginalExtension();
        $path = $file->storeAs($directory, $filename, 'uploads');

        $po->media()->create([
            'type' => $file->getClientOriginalExtension(),
            'path' => $path,
            'original_name' => $file->getClientOriginalName(),
            'mime_type' => $file->getClientMimeType(),
            'size' => $file->getSize(),
            'note' => $note,
            'file_status' => null,
        ]);
    }

    protected function deleteExistingMedia(ClientPo $po): void
    {
        $media = $po->media;

        if (! $media) {
            return;
        }

        $disk = Storage::disk('uploads');
        if ($media->path && $disk->exists($media->path)) {
            $disk->delete($media->path);
        }

        $media->delete();
    }
}
