<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateInvoiceStatusRequest;
use App\Models\FreelancerInvoice;
use App\Models\Media;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class VendorInvoiceController extends Controller
{
    public function index(Request $request)
    {
        Gate::authorize('View Vendor Invoice');

        $query = FreelancerInvoice::query()
            ->with(['freelancerPo.freelancer', 'freelancerPo.task', 'freelancerPo.services', 'freelancerPo.media', 'freelancerPo.mediaFiles']);

        // Filter by status
        if ($request->filled('status')) {
            $query->where('status', $request->string('status'));
        }

        // Filter by task number
        if ($request->filled('task_number')) {
            $query->whereHas('freelancerPo', function ($q) use ($request) {
                $q->where('task_code', 'like', '%' . $request->string('task_number') . '%');
            });
        }

        // Filter by vendor code
        if ($request->filled('vendor_code')) {
            $query->whereHas('freelancerPo', function ($q) use ($request) {
                $q->where('freelancer_code', 'like', '%' . $request->string('vendor_code') . '%');
            });
        }

        $invoices = $query->latest()->paginate(15)->withQueryString();

        return view('dashboard.finance.invoices.vendor-invoices', compact('invoices'));
    }

    public function update(UpdateInvoiceStatusRequest $request, FreelancerInvoice $vendorInvoice)
    {
        Gate::authorize('Update Vendor Invoice');

        if ($vendorInvoice->status === 'completed' && ! Auth::user()->isAdministrator()) {
            abort(403, 'Only administrators can edit completed invoices.');
        }

        // Update the invoice status
        $vendorInvoice->update([
            'status' => $request->validated('status'),
        ]);

        // Handle file upload if provided
        if ($request->hasFile('file')) {
            $this->storeFile($vendorInvoice->freelancerPo, $request->file('file'));
        }

        return redirect()
            ->route('dashboard.finance.invoices.vendor-invoices')
            ->with('success', 'Invoice updated successfully.');
    }

    public function downloadPo(FreelancerInvoice $vendorInvoice, ?int $media = null)
    {
        Gate::authorize('Download Vendor Invoice PO');

        $po = $vendorInvoice->freelancerPo;

        if ($media) {
            $mediaFile = $po->mediaFiles()->findOrFail($media);
        } else {
            $mediaFile = $po->media;
        }

        abort_if(! $mediaFile || ! Storage::disk('uploads')->exists($mediaFile->path), 404);

        return response()->download(Storage::disk('uploads')->path($mediaFile->path), $mediaFile->original_name);
    }

    public function destroy(FreelancerInvoice $vendorInvoice)
    {
        Gate::authorize('Delete Vendor Invoice');

        $vendorInvoice->delete();

        return redirect()
            ->route('dashboard.finance.invoices.vendor-invoices')
            ->with('success', 'Invoice deleted successfully.');
    }

    public function destroyFile(FreelancerInvoice $vendorInvoice, Media $media)
    {
        Gate::authorize('Update Vendor Invoice');

        if ($vendorInvoice->status === 'completed' && ! Auth::user()->isAdministrator()) {
            abort(403, 'Only administrators can edit completed invoices.');
        }

        $po = $vendorInvoice->freelancerPo;
        $mediaFile = $po->mediaFiles()->findOrFail($media->id);

        abort_if($mediaFile->mediaable_type !== get_class($po) || $mediaFile->mediaable_id !== $po->id, 404);

        $disk = Storage::disk('uploads');

        if ($mediaFile->path && $disk->exists($mediaFile->path)) {
            $disk->delete($mediaFile->path);
        }

        $mediaFile->delete();

        return redirect()
            ->route('dashboard.finance.invoices.vendor-invoices')
            ->with('success', 'Invoice file deleted successfully.');
    }

    private function storeFile($po, UploadedFile $file): void
    {
        $filename = Str::uuid() . '.' . $file->getClientOriginalExtension();
        $path = $file->storeAs('freelancer-pos', $filename, 'uploads');

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
