<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\FreelancerInvoiceRequest;
use App\Http\Requests\UpdateFreelancerInvoiceRequest;
use App\Models\FinanceFreelancerInvoice;
use App\Models\FreelancerPo;
use App\Models\Media;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class FinanceFreelancerInvoiceController extends Controller
{
    public function index(Request $request)
    {
        Gate::authorize('View Vendor Invoice');

        $query = FinanceFreelancerInvoice::query()->with('media');

        // Filter by status
        if ($request->filled('status')) {
            $query->where('status', $request->string('status'));
        }

        // Filter by task number
        if ($request->filled('task_number')) {
            $query->where('task_code', 'like', '%' . $request->string('task_number') . '%');
        }

        // Filter by vendor code
        if ($request->filled('vendor_code')) {
            $query->where('freelancer_code', 'like', '%' . $request->string('vendor_code') . '%');
        }

        $invoices = $query->latest()->paginate(15)->withQueryString();

        return view('dashboard.finance.invoices.finance-freelancer-invoices', compact('invoices'));
    }

    public function create(?FreelancerPo $freelancerPo = null)
    {
        Gate::authorize('Create Vendor Invoice');

        // If coming from PO, pre-fill data
        $invoiceData = null;
        if ($freelancerPo) {
            $invoiceData = [
                'freelancer_code' => $freelancerPo->freelancer_code,
                'task_code' => $freelancerPo->task_code,
                'project_name' => $freelancerPo->project_name,
                'page_number' => $freelancerPo->page_number,
                'price' => $freelancerPo->price,
                'start_date' => $freelancerPo->start_date,
                'payment_date' => $freelancerPo->payment_date,
                'note' => $freelancerPo->note,
            ];
        }

        return view('dashboard.finance.invoices.finance-freelancer-invoices.create', compact('invoiceData', 'freelancerPo'));
    }

    public function store(FreelancerInvoiceRequest $request)
    {
        Gate::authorize('Create Vendor Invoice');

        $validated = $request->validated();

        DB::transaction(function () use ($validated, $request) {
            $invoice = FinanceFreelancerInvoice::create([
                'freelancer_code' => $validated['freelancer_code'],
                'task_code' => $validated['task_code'],
                'project_name' => $validated['project_name'] ?? null,
                'page_number' => $validated['page_number'] ?? null,
                'price' => $validated['price'],
                'start_date' => $validated['start_date'] ?? null,
                'payment_date' => $validated['payment_date'] ?? null,
                'note' => $validated['note'] ?? null,
                'status' => $validated['status'],
            ]);

            // Handle file upload if provided
            if ($request->hasFile('file')) {
                $this->storeInvoiceFile($invoice, $request->file('file'));
            }
        });

        return redirect()
            ->route('dashboard.finance.invoices.finance-freelancer-invoices')
            ->with('success', 'Freelancer Invoice created successfully.');
    }

    public function edit(FinanceFreelancerInvoice $financeFreelancerInvoice)
    {
        Gate::authorize('Update Vendor Invoice');

        $financeFreelancerInvoice->load('media');

        return view('dashboard.finance.invoices.finance-freelancer-invoices.edit', compact('financeFreelancerInvoice'));
    }

    public function update(UpdateFreelancerInvoiceRequest $request, FinanceFreelancerInvoice $financeFreelancerInvoice)
    {
        Gate::authorize('Update Vendor Invoice');

        if ($financeFreelancerInvoice->status === 'completed' && ! Auth::user()->isAdministrator()) {
            abort(403, 'Only administrators can edit completed invoices.');
        }

        $validated = $request->validated();

        DB::transaction(function () use ($financeFreelancerInvoice, $validated, $request) {
            $financeFreelancerInvoice->update([
                'freelancer_code' => $validated['freelancer_code'],
                'task_code' => $validated['task_code'],
                'project_name' => $validated['project_name'] ?? null,
                'page_number' => $validated['page_number'] ?? null,
                'price' => $validated['price'],
                'start_date' => $validated['start_date'] ?? null,
                'payment_date' => $validated['payment_date'] ?? null,
                'note' => $validated['note'] ?? null,
                'status' => $validated['status'],
            ]);

            // Handle file upload if provided
            if ($request->hasFile('file')) {
                $this->storeInvoiceFile($financeFreelancerInvoice, $request->file('file'));
            }
        });

        return redirect()
            ->route('dashboard.finance.invoices.finance-freelancer-invoices')
            ->with('success', 'Invoice updated successfully.');
    }

    public function destroy(FinanceFreelancerInvoice $financeFreelancerInvoice)
    {
        Gate::authorize('Delete Vendor Invoice');

        // Delete associated media files
        foreach ($financeFreelancerInvoice->media as $mediaFile) {
            $disk = Storage::disk('uploads');
            if ($mediaFile->path && $disk->exists($mediaFile->path)) {
                $disk->delete($mediaFile->path);
            }
            $mediaFile->delete();
        }

        $financeFreelancerInvoice->delete();

        return redirect()
            ->route('dashboard.finance.invoices.finance-freelancer-invoices')
            ->with('success', 'Invoice deleted successfully.');
    }

    public function download(FinanceFreelancerInvoice $financeFreelancerInvoice, Media $media)
    {
        Gate::authorize('View Vendor Invoice');

        $mediaFile = $financeFreelancerInvoice->media()->findOrFail($media->id);
        abort_if($mediaFile->mediaable_type !== get_class($financeFreelancerInvoice) || $mediaFile->mediaable_id !== $financeFreelancerInvoice->id, 404);
        abort_if(!Storage::disk('uploads')->exists($mediaFile->path), 404);

        return response()->download(Storage::disk('uploads')->path($mediaFile->path), $mediaFile->original_name);
    }

    public function destroyFile(FinanceFreelancerInvoice $financeFreelancerInvoice, Media $media)
    {
        Gate::authorize('Update Vendor Invoice');

        if ($financeFreelancerInvoice->status === 'completed' && ! Auth::user()->isAdministrator()) {
            abort(403, 'Only administrators can edit completed invoices.');
        }

        $mediaFile = $financeFreelancerInvoice->media()->findOrFail($media->id);
        abort_if($mediaFile->mediaable_type !== get_class($financeFreelancerInvoice) || $mediaFile->mediaable_id !== $financeFreelancerInvoice->id, 404);

        $disk = Storage::disk('uploads');

        if ($mediaFile->path && $disk->exists($mediaFile->path)) {
            $disk->delete($mediaFile->path);
        }

        $mediaFile->delete();

        return redirect()
            ->route('dashboard.finance.invoices.finance-freelancer-invoices')
            ->with('success', 'Invoice file deleted successfully.');
    }

    private function storeInvoiceFile(FinanceFreelancerInvoice $invoice, UploadedFile $file): void
    {
        $filename = Str::uuid() . '.' . $file->getClientOriginalExtension();
        $path = $file->storeAs('finance-freelancer-invoices', $filename, 'uploads');

        $invoice->media()->create([
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
