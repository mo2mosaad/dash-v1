<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\ClientPartnerRequest;
use App\Models\ClientPartner;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Str;
use Illuminate\View\View;

class ClientPartnerController extends Controller
{
    public function index(Request $request): View
    {
        Gate::authorize('View Client Partner');

        $clientPartners = ClientPartner::query()
            ->when($request->filled('search'), function ($query) use ($request) {
                $term = '%' . (string) $request->string('search')->trim() . '%';
                $query->where('name', 'like', $term);
            })
            ->orderBy('order')
            ->orderBy('name')
            ->paginate(15)
            ->withQueryString();

        return view('dashboard.client-partners.index', compact('clientPartners'));
    }

    public function create(): View
    {
        Gate::authorize('Create Client Partner');

        return view('dashboard.client-partners.create');
    }

    public function store(ClientPartnerRequest $request): RedirectResponse
    {
        Gate::authorize('Create Client Partner');

        $data = $request->safe()->only(['name', 'order', 'is_active']);

        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = Str::uuid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('assets/website/images/clients'), $filename);
            $data['image_path'] = 'clients/' . $filename;
        }

        ClientPartner::create($data);

        return redirect()
            ->route('dashboard.client-partners.index')
            ->with('success', 'Client partner created successfully.');
    }

    public function show(ClientPartner $clientPartner): View
    {
        Gate::authorize('View Client Partner');

        return view('dashboard.client-partners.show', compact('clientPartner'));
    }

    public function edit(ClientPartner $clientPartner): View
    {
        Gate::authorize('Update Client Partner');

        return view('dashboard.client-partners.edit', compact('clientPartner'));
    }

    public function update(ClientPartnerRequest $request, ClientPartner $clientPartner): RedirectResponse
    {
        Gate::authorize('Update Client Partner');

        $data = $request->safe()->only(['name', 'order', 'is_active']);

        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($clientPartner->image_path && file_exists(public_path('assets/website/images/' . $clientPartner->image_path))) {
                unlink(public_path('assets/website/images/' . $clientPartner->image_path));
            }

            $file = $request->file('image');
            $filename = Str::uuid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('assets/website/images/clients'), $filename);
            $data['image_path'] = 'clients/' . $filename;
        }

        $clientPartner->update($data);

        return redirect()
            ->route('dashboard.client-partners.index')
            ->with('success', 'Client partner updated successfully.');
    }

    public function destroy(ClientPartner $clientPartner): RedirectResponse
    {
        Gate::authorize('Delete Client Partner');

        // Delete image if exists
        if ($clientPartner->image_path && file_exists(public_path('assets/website/images/' . $clientPartner->image_path))) {
            unlink(public_path('assets/website/images/' . $clientPartner->image_path));
        }

        $clientPartner->delete();

        return redirect()
            ->route('dashboard.client-partners.index')
            ->with('success', 'Client partner deleted successfully.');
    }
}
