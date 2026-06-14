<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateInvoiceStatusRequest;
use App\Models\ClientInvoice;
use App\Models\Media;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ClientInvoiceController extends Controller
{
    public function index(Request $request)
    {
        Gate::authorize('View Client Invoice');

        $query = ClientInvoice::query()
            ->with(['clientPo.client', 'clientPo.task', 'clientPo.services', 'clientPo.media', 'clientPo.mediaFiles']);

        // Filter by status
        if ($request->filled('status')) {
            $query->where('status', $request->string('status'));
        }

        // Filter by task number
        if ($request->filled('task_number')) {
            $query->whereHas('clientPo', function ($q) use ($request) {
                $q->where('task_code', 'like', '%' . $request->string('task_number') . '%');
            });
        }

        // Filter by client code
        if ($request->filled('client_code')) {
            $query->whereHas('clientPo', function ($q) use ($request) {
                $q->where('client_code', 'like', '%' . $request->string('client_code') . '%');
            });
        }

        $invoices = $query->latest()->paginate(15)->withQueryString();

        return view('dashboard.finance.invoices.client-invoices', compact('invoices'));
    }

    public function update(UpdateInvoiceStatusRequest $request, ClientInvoice $clientInvoice)
    {
        Gate::authorize('Update Client Invoice');

        if ($clientInvoice->status === 'completed' && ! Auth::user()->isAdministrator()) {
            abort(403, 'Only administrators can edit completed invoices.');
        }

        // Update the existing invoice status
        $clientInvoice->update([
            'status' => $request->validated('status'),
        ]);

        // Handle file upload if provided
        if ($request->hasFile('file')) {
            $this->storeFile($clientInvoice->clientPo, $request->file('file'));
        }

        return redirect()
            ->route('dashboard.finance.invoices.client-invoices')
            ->with('success', 'Invoice updated successfully.');
    }

    public function downloadPo(ClientInvoice $clientInvoice, ?int $media = null)
    {
        Gate::authorize('Download Client Invoice PO');

        $po = $clientInvoice->clientPo;

        if ($media) {
            $mediaFile = $po->mediaFiles()->findOrFail($media);
        } else {
            $mediaFile = $po->media;
        }

        abort_if(! $mediaFile || ! Storage::disk('uploads')->exists($mediaFile->path), 404);

        return response()->download(Storage::disk('uploads')->path($mediaFile->path), $mediaFile->original_name);
    }

    public function destroy(ClientInvoice $clientInvoice)
    {
        Gate::authorize('Delete Client Invoice');

        $clientInvoice->delete();

        return redirect()
            ->route('dashboard.finance.invoices.client-invoices')
            ->with('success', 'Invoice deleted successfully.');
    }

    public function destroyFile(ClientInvoice $clientInvoice, Media $media)
    {
        Gate::authorize('Update Client Invoice');

        if ($clientInvoice->status === 'completed' && ! Auth::user()->isAdministrator()) {
            abort(403, 'Only administrators can edit completed invoices.');
        }

        $po = $clientInvoice->clientPo;
        $mediaFile = $po->mediaFiles()->findOrFail($media->id);

        abort_if($mediaFile->mediaable_type !== get_class($po) || $mediaFile->mediaable_id !== $po->id, 404);

        $disk = Storage::disk('uploads');

        if ($mediaFile->path && $disk->exists($mediaFile->path)) {
            $disk->delete($mediaFile->path);
        }

        $mediaFile->delete();

        return redirect()
            ->route('dashboard.finance.invoices.client-invoices')
            ->with('success', 'Invoice file deleted successfully.');
    }

    private function storeFile($po, UploadedFile $file): void
    {
        $filename = Str::uuid() . '.' . $file->getClientOriginalExtension();
        $path = $file->storeAs('client-pos', $filename, 'uploads');

        $po->mediaFiles()->create([
            'type' => $file->getClientOriginalExtension(),
            'path' => $path,
            'original_name' => $file->getClientOriginalName(),
            'mime_type' => $file->getClientMimeType(),
            'size' => $file->getSize(),
            'note' => null,
            'file_status' => null,
        ]);
    }
}
