<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\VendorPoRequest;
use App\Http\Requests\UpdateVendorPoRequest;
use App\Models\FreelancerPo;
use App\Models\Service;
use App\Models\Task;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Throwable;

class VendorPoController extends Controller
{
    public function index(Task $task)
    {
        Gate::authorize('View Vendor PO');

        $vendorPos = FreelancerPo::query()
            ->with(['media', 'services', 'freelancer'])
            ->where('task_code', $task->task_number)
            ->latest()
            ->paginate(10)
            ->withQueryString();

        return view('dashboard.tasks.vendor-pos.index', compact('task', 'vendorPos'));
    }

    public function create(Task $task)
    {
        Gate::authorize('Create Vendor PO');

        $services = Service::query()
            ->where('status', 'active')
            ->orderBy('name')
            ->get();

        return view('dashboard.tasks.vendor-pos.create', compact('task', 'services'));
    }

    public function store(VendorPoRequest $request, Task $task)
    {
        Gate::authorize('Create Vendor PO');

        $validated = $request->validated();

        try {
            DB::transaction(function () use ($validated, $task, $request) {
                $vendorPo = FreelancerPo::create([
                    'freelancer_code' => $validated['freelancer_code'],
                    'task_code' => $task->task_number,
                    'project_name' => $validated['project_name'],
                    'page_number' => $validated['page_number'],
                    'price' => $validated['price'],
                    'start_date' => $validated['start_date'],
                    'payment_date' => $validated['payment_date'],
                    'note' => $validated['note'] ?? null,
                    'status' => 'pending',
                    'created_by' => Auth::id(),
                ]);

                $vendorPo->services()->sync($validated['service_ids'] ?? []);

                $this->storePoMedia($vendorPo, $request->file('po_file'), $validated['note'] ?? null, 'vendor-pos');

            });

            if ($request->wantsJson() || $request->ajax()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Vendor PO created successfully.',
                    'redirect' => route('dashboard.tasks.vendor-pos.index', $task),
                ]);
            }

            return redirect()
                ->route('dashboard.tasks.vendor-pos.index', $task)
                ->with('success', 'Vendor PO created successfully.');
        } catch (Throwable $e) {
            if ($request->wantsJson() || $request->ajax()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Failed to create Vendor PO. Please try again.',
                    'errors' => ['po_file' => 'Failed to create Vendor PO. Please try again.'],
                ], 500);
            }

            return redirect()
                ->back()
                ->withInput()
                ->with('error', 'Failed to create Vendor PO. Please try again.');
        }
    }

    public function edit(Task $task, FreelancerPo $vendorPo)
    {
        Gate::authorize('Update Vendor PO');

        abort_unless($vendorPo->task_code === $task->task_number, 404);

        $services = Service::query()
            ->where('status', 'active')
            ->orderBy('name')
            ->get();

        return view('dashboard.tasks.vendor-pos.edit', compact('task', 'vendorPo', 'services'));
    }

    public function update(UpdateVendorPoRequest $request, Task $task, FreelancerPo $vendorPo)
    {
        Gate::authorize('Update Vendor PO');

        abort_unless($vendorPo->task_code === $task->task_number, 404);

        $validated = $request->validated();

        DB::transaction(function () use ($validated, $vendorPo, $request) {
            $vendorPo->update([
                'freelancer_code' => $validated['freelancer_code'],
                'project_name' => $validated['project_name'],
                'page_number' => $validated['page_number'],
                'price' => $validated['price'],
                'start_date' => $validated['start_date'],
                'payment_date' => $validated['payment_date'],
                'note' => $validated['note'] ?? null,
                'status' => $vendorPo->status,
            ]);

            $vendorPo->services()->sync($validated['service_ids'] ?? []);

            if ($request->hasFile('po_file')) {
                $this->storePoMedia($vendorPo, $request->file('po_file'), $validated['note'] ?? null, 'vendor-pos');
            } elseif (array_key_exists('note', $validated) && $vendorPo->media) {
                $vendorPo->media()->update(['note' => $validated['note']]);
            }
        });

        if ($request->wantsJson() || $request->ajax()) {
            return response()->json([
                'success' => true,
                'message' => 'Vendor PO updated successfully.',
                'redirect' => route('dashboard.tasks.vendor-pos.index', $task),
            ]);
        }

        return redirect()
            ->route('dashboard.tasks.vendor-pos.index', $task)
            ->with('success', 'Vendor PO updated successfully.');
    }

    public function download(Task $task, FreelancerPo $vendorPo)
    {
        Gate::authorize('Download Vendor PO');

        abort_unless($vendorPo->task_code === $task->task_number, 404);

        $media = $vendorPo->media;
        abort_if(! $media || ! Storage::disk('uploads')->exists($media->path), 404);

        return response()->download(Storage::disk('uploads')->path($media->path), $media->original_name);
    }

    public function destroyFile(Task $task, FreelancerPo $vendorPo)
    {
        Gate::authorize('Update Vendor PO');

        abort_unless($vendorPo->task_code === $task->task_number, 404);

        $this->deleteExistingMedia($vendorPo);

        return redirect()
            ->route('dashboard.tasks.vendor-pos.index', $task)
            ->with('success', 'PO file deleted successfully. You can upload a new PDF now.');
    }

    public function destroy(Task $task, FreelancerPo $vendorPo)
    {
        Gate::authorize('Delete Vendor PO');

        abort_unless($vendorPo->task_code === $task->task_number, 404);

        DB::transaction(function () use ($vendorPo) {
            // Detach related services
            $vendorPo->services()->detach();

            // Delete all media files (single and multiple) from storage and DB
            $disk = Storage::disk('uploads');

            $vendorPo->mediaFiles->each(function ($media) use ($disk) {
                if ($media->path && $disk->exists($media->path)) {
                    $disk->delete($media->path);
                }
                $media->delete();
            });

            if ($vendorPo->media) {
                if ($vendorPo->media->path && $disk->exists($vendorPo->media->path)) {
                    $disk->delete($vendorPo->media->path);
                }
                $vendorPo->media->delete();
            }

            $vendorPo->delete();
        });

        return redirect()
            ->route('dashboard.tasks.vendor-pos.index', $task)
            ->with('success', 'Vendor PO and its files deleted successfully.');
    }

    protected function storePoMedia(FreelancerPo $po, UploadedFile $file, ?string $note, string $directory): void
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

    protected function deleteExistingMedia(FreelancerPo $po): void
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
