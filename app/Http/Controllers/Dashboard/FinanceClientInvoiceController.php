<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\ClientInvoiceRequest;
use App\Http\Requests\UpdateClientInvoiceRequest;
use App\Models\FinanceClientInvoice;
use App\Models\ClientPo;
use App\Models\Media;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class FinanceClientInvoiceController extends Controller
{
    public function index(Request $request)
    {
        Gate::authorize('View Client Invoice');

        $query = FinanceClientInvoice::query()->with('media');

        // Filter by status
        if ($request->filled('status')) {
            $query->where('status', $request->string('status'));
        }

        // Filter by task number
        if ($request->filled('task_number')) {
            $query->where('task_code', 'like', '%' . $request->string('task_number') . '%');
        }

        // Filter by client code
        if ($request->filled('client_code')) {
            $query->where('client_code', 'like', '%' . $request->string('client_code') . '%');
        }

        $invoices = $query->latest()->paginate(15)->withQueryString();

        // Check existence for each invoice
        foreach ($invoices as $invoice) {
            $invoice->client_exists = $invoice->client_code ? \App\Models\Client::where('client_code', $invoice->client_code)->exists() : false;
            $invoice->task_exists = $invoice->task_code ? \App\Models\Task::where('task_number', $invoice->task_code)->exists() : false;
        }

        return view('dashboard.finance.invoices.finance-client-invoices', compact('invoices'));
    }

    public function create(?ClientPo $clientPo = null)
    {
        Gate::authorize('Create Client Invoice');

        // If coming from PO, pre-fill data
        $invoiceData = null;
        if ($clientPo) {
            $invoiceData = [
                'task_code' => $clientPo->task_code,
                'client_code' => $clientPo->client_code,
                'date_20' => $clientPo->date_20,
                'date_80' => $clientPo->date_80,
                'payment_20' => $clientPo->payment_20,
                'payment_80' => $clientPo->payment_80,
                'total_price' => $clientPo->total_price,
                'note' => $clientPo->media?->note,
            ];
        }

        return view('dashboard.finance.invoices.finance-client-invoices.create', compact('invoiceData', 'clientPo'));
    }

    public function store(ClientInvoiceRequest $request)
    {
        Gate::authorize('Create Client Invoice');

        $validated = $request->validated();

        DB::transaction(function () use ($validated, $request) {
            $invoice = FinanceClientInvoice::create([
                'task_code' => $validated['task_code'],
                'client_code' => $validated['client_code'],
                'date_20' => $validated['date_20'] ?? null,
                'date_80' => $validated['date_80'] ?? null,
                'payment_20' => $validated['payment_20'] ?? null,
                'payment_80' => $validated['payment_80'] ?? null,
                'total_price' => $validated['total_price'],
                'note' => $validated['note'] ?? null,
                'status' => $validated['status'],
            ]);

            // Handle file upload if provided
            if ($request->hasFile('file')) {
                $this->storeInvoiceFile($invoice, $request->file('file'));
            }
        });

        return redirect()
            ->route('dashboard.finance.invoices.finance-client-invoices')
            ->with('success', 'Client Invoice created successfully.');
    }

    public function show(FinanceClientInvoice $financeClientInvoice)
    {
        Gate::authorize('View Client Invoice');

        $financeClientInvoice->load('media');

        // Check if client exists
        $client = null;
        if ($financeClientInvoice->client_code) {
            $client = \App\Models\Client::where('client_code', $financeClientInvoice->client_code)->first();
        }

        // Check if task exists
        $task = null;
        if ($financeClientInvoice->task_code) {
            $task = \App\Models\Task::where('task_number', $financeClientInvoice->task_code)->first();
        }

        return view('dashboard.finance.invoices.finance-client-invoices.show', compact('financeClientInvoice', 'client', 'task'));
    }

    public function edit(FinanceClientInvoice $financeClientInvoice)
    {
        Gate::authorize('Update Client Invoice');

        $financeClientInvoice->load('media');

        return view('dashboard.finance.invoices.finance-client-invoices.edit', compact('financeClientInvoice'));
    }

    public function update(UpdateClientInvoiceRequest $request, FinanceClientInvoice $financeClientInvoice)
    {
        Gate::authorize('Update Client Invoice');

        if ($financeClientInvoice->status === 'completed' && ! Auth::user()->isAdministrator()) {
            abort(403, 'Only administrators can edit completed invoices.');
        }

        $validated = $request->validated();

        DB::transaction(function () use ($financeClientInvoice, $validated, $request) {
            $financeClientInvoice->update([
                'task_code' => $validated['task_code'],
                'client_code' => $validated['client_code'],
                'date_20' => $validated['date_20'] ?? null,
                'date_80' => $validated['date_80'] ?? null,
                'payment_20' => $validated['payment_20'] ?? null,
                'payment_80' => $validated['payment_80'] ?? null,
                'total_price' => $validated['total_price'],
                'note' => $validated['note'] ?? null,
                'status' => $validated['status'],
            ]);

            // Handle file upload if provided
            if ($request->hasFile('file')) {
                $this->storeInvoiceFile($financeClientInvoice, $request->file('file'));
            }
        });

        return redirect()
            ->route('dashboard.finance.invoices.finance-client-invoices')
            ->with('success', 'Invoice updated successfully.');
    }

    public function destroy(FinanceClientInvoice $financeClientInvoice)
    {
        Gate::authorize('Delete Client Invoice');

        // Delete associated media files
        foreach ($financeClientInvoice->media as $mediaFile) {
            $disk = Storage::disk('uploads');
            if ($mediaFile->path && $disk->exists($mediaFile->path)) {
                $disk->delete($mediaFile->path);
            }
            $mediaFile->delete();
        }

        $financeClientInvoice->delete();

        return redirect()
            ->route('dashboard.finance.invoices.finance-client-invoices')
            ->with('success', 'Invoice deleted successfully.');
    }

    public function download(FinanceClientInvoice $financeClientInvoice, Media $media)
    {
        Gate::authorize('Download Finance Client Invoice File');

        $mediaFile = $financeClientInvoice->media()->findOrFail($media->id);
        abort_if($mediaFile->mediaable_type !== get_class($financeClientInvoice) || $mediaFile->mediaable_id !== $financeClientInvoice->id, 404);
        abort_if(!Storage::disk('uploads')->exists($mediaFile->path), 404);

        return response()->download(Storage::disk('uploads')->path($mediaFile->path), $mediaFile->original_name);
    }

    public function destroyFile(FinanceClientInvoice $financeClientInvoice, Media $media)
    {
        Gate::authorize('Delete Finance Client Invoice File');

        if ($financeClientInvoice->status === 'completed' && ! Auth::user()->isAdministrator()) {
            abort(403, 'Only administrators can edit completed invoices.');
        }

        $mediaFile = $financeClientInvoice->media()->findOrFail($media->id);
        abort_if($mediaFile->mediaable_type !== get_class($financeClientInvoice) || $mediaFile->mediaable_id !== $financeClientInvoice->id, 404);

        $disk = Storage::disk('uploads');

        if ($mediaFile->path && $disk->exists($mediaFile->path)) {
            $disk->delete($mediaFile->path);
        }

        $mediaFile->delete();

        return redirect()
            ->route('dashboard.finance.invoices.finance-client-invoices')
            ->with('success', 'Invoice file deleted successfully.');
    }

    private function storeInvoiceFile(FinanceClientInvoice $invoice, UploadedFile $file): void
    {
        $filename = Str::uuid() . '.' . $file->getClientOriginalExtension();
        $path = $file->storeAs('finance-client-invoices', $filename, 'uploads');

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
