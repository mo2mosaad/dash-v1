<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\ClientRequest;
use App\Models\Client;
use App\Models\Media;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ClientController extends Controller
{
    public function index(Request $request)
    {
        Gate::authorize('View Client');

        $clients = Client::query()
            ->when($request->filled('search'), function ($query) use ($request) {
                $term = '%' . (string) $request->string('search')->trim() . '%';

                $query->where(function ($subQuery) use ($term) {
                    $subQuery
                        ->where('client_code', 'like', $term)
                        ->orWhere('name', 'like', $term)
                        ->orWhere('email', 'like', $term)
                        ->orWhere('phone', 'like', $term)
                        ->orWhere('agency', 'like', $term);
                });
            })
            ->latest()
            ->paginate(15)
            ->withQueryString();

        return view('dashboard.clients.index', compact('clients'));
    }

    public function create()
    {
        Gate::authorize('Create Client');

        $c_code = Client::nextClientCode();

        return view('dashboard.clients.create', compact('c_code'));
    }

    public function store(ClientRequest $request)
    {
        Gate::authorize('Create Client');

        $client = Client::create(
            $this->mappedData($request) + ['created_by' => Auth::id()]
        );

        $this->storeAttachments($request, $client);

        if ($request->wantsJson() || $request->ajax()) {
            return response()->json([
                'success' => true,
                'message' => 'Client created successfully.',
                'redirect' => route('dashboard.clients.index'),
            ]);
        }

        return redirect()
            ->route('dashboard.clients.index')
            ->with('success', 'Client created successfully.');
    }

    public function show(Client $client)
    {
        Gate::authorize('View Client');

        return view('dashboard.clients.show', compact('client'));
    }

    public function edit(Client $client)
    {
        Gate::authorize('Update Client');

        $client->load('media');

        return view('dashboard.clients.edit', compact('client'));
    }

    public function update(ClientRequest $request, Client $client)
    {
        Gate::authorize('Update Client');

        $client->update($this->mappedData($request));

        $this->storeAttachments($request, $client);

        if ($request->wantsJson() || $request->ajax()) {
            return response()->json([
                'success' => true,
                'message' => 'Client updated successfully.',
                'redirect' => route('dashboard.clients.index'),
            ]);
        }

        return redirect()
            ->route('dashboard.clients.index')
            ->with('success', 'Client updated successfully.');
    }

    public function destroy(Client $client)
    {
        Gate::authorize('Delete Client');

        $disk = Storage::disk('uploads');

        $client->media->each(function (Media $media) use ($disk) {
            if ($media->path && $disk->exists($media->path)) {
                $disk->delete($media->path);
            }
            $media->delete();
        });

        $client->delete();

        return redirect()
            ->route('dashboard.clients.index')
            ->with('success', 'Client deleted successfully.');
    }

    public function downloadAttachment(Client $client, Media $media)
    {
        Gate::authorize('Download Client Attachment');

        abort_if($media->mediaable_type !== Client::class || $media->mediaable_id !== $client->id, 404);

        $disk = Storage::disk('uploads');
        abort_unless($disk->exists($media->path), 404);

        return $disk->download($media->path, $media->original_name);
    }

    public function destroyAttachment(Client $client, Media $media)
    {
        Gate::authorize('Delete Client Attachment');

        abort_if($media->mediaable_type !== Client::class || $media->mediaable_id !== $client->id, 404);

        $disk = Storage::disk('uploads');
        if ($media->path && $disk->exists($media->path)) {
            $disk->delete($media->path);
        }

        $media->delete();

        return redirect()
            ->back()
            ->with('success', 'Attachment deleted successfully.');
    }

    protected function storeAttachments(Request $request, Client $client): void
    {
        if (! $request->hasFile('attachments')) {
            return;
        }

        foreach ($request->file('attachments') as $attachment) {
            $filename = Str::uuid() . '.' . $attachment->getClientOriginalExtension();
            $path = $attachment->storeAs('clients', $filename, 'uploads');

            $client->media()->create([
                'type' => $attachment->getClientOriginalExtension(),
                'path' => $path,
                'original_name' => $attachment->getClientOriginalName(),
                'mime_type' => $attachment->getClientMimeType(),
                'size' => $attachment->getSize(),
            ]);
        }
    }

    protected function mappedData(ClientRequest $request): array
    {
        $validated = $request->validated();

        $validated['contact_people'] = collect($validated['contact_people'] ?? [])
            ->map(function (array $contact) {
                return [
                    'name' => trim((string) ($contact['name'] ?? '')),
                    'email' => trim((string) ($contact['email'] ?? '')),
                    'notes' => trim((string) ($contact['notes'] ?? '')),
                ];
            })
            ->filter(function (array $contact) {
                return $contact['name'] !== '' || $contact['email'] !== '' || $contact['notes'] !== '';
            })
            ->values()
            ->all();

        return $validated;
    }
}
