<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\IndustryRequest;
use App\Models\Industry;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Throwable;

class IndustryController extends Controller
{
    public function index(Request $request)
    {
        Gate::authorize('View Industry');

        $industries = Industry::query()
            ->with(['iconMedia'])
            ->when($request->filled('search'), function ($query) use ($request) {
                $term = '%' . (string) $request->string('search')->trim() . '%';
                $query->where('name', 'like', $term);
            })
            ->latest()
            ->paginate(15)
            ->withQueryString();

        return view('dashboard.industries.index', compact('industries'));
    }

    public function create()
    {
        Gate::authorize('Create Industry');

        return view('dashboard.industries.create');
    }

    public function store(IndustryRequest $request)
    {
        Gate::authorize('Create Industry');

        DB::beginTransaction();

        try {
            $data = $request->safe()->only(['name', 'description', 'content', 'slug']);
            $data['slug'] = $data['slug'] ? Str::slug($data['slug']) : Str::slug($data['name']);
            
            $industry = Industry::create($data);

            $this->storeImage($request, $industry);
            $this->storeIcon($request, $industry);

            DB::commit();

            return redirect()
                ->route('dashboard.industries.index')
                ->with('success', 'Industry created successfully.');
        } catch (Throwable $e) {
            DB::rollBack();

            return redirect()
                ->back()
                ->withInput()
                ->with('error', 'Failed to create industry. Please try again.');
        }
    }

    public function show(Industry $industry)
    {
        Gate::authorize('View Industry');

        $industry->load(['media', 'iconMedia']);

        return view('dashboard.industries.show', compact('industry'));
    }

    public function edit(Industry $industry)
    {
        Gate::authorize('Update Industry');

        $industry->load(['media', 'iconMedia']);

        return view('dashboard.industries.edit', compact('industry'));
    }

    public function update(IndustryRequest $request, Industry $industry)
    {
        Gate::authorize('Update Industry');

        DB::beginTransaction();

        try {
            $data = $request->safe()->only(['name', 'description', 'content', 'slug']);
            $data['slug'] = $data['slug'] ? Str::slug($data['slug']) : Str::slug($data['name']);
            
            $industry->update($data);

            // Check if image file was uploaded using Request instance
            $baseRequest = request();
            if ($baseRequest->hasFile('image')) {
                $this->storeImage($baseRequest, $industry);
            }

            if ($baseRequest->hasFile('icon')) {
                $this->storeIcon($baseRequest, $industry);
            }

            DB::commit();

            return redirect()
                ->route('dashboard.industries.index')
                ->with('success', 'Industry updated successfully.');
        } catch (Throwable $e) {
            DB::rollBack();

            return redirect()
                ->back()
                ->withInput()
                ->with('error', 'Failed to update industry. Please try again.');
        }
    }

    public function destroy(Industry $industry)
    {
        Gate::authorize('Delete Industry');

        $this->deleteImage($industry);
        $this->deleteIcon($industry);
        $industry->delete();

        return redirect()
            ->route('dashboard.industries.index')
            ->with('success', 'Industry deleted successfully.');
    }

    protected function storeImage(Request $request, Industry $industry): void
    {
        if (! $request->hasFile('image')) {
            return;
        }

        // Delete existing image if exists (since it's morphOne, only one image allowed)
        if ($industry->media) {
            $this->deleteImage($industry);
        }

        $image = $request->file('image');
        $filename = Str::uuid() . '.' . $image->getClientOriginalExtension();
        $path = $image->storeAs('industries', $filename, 'uploads');

        $industry->media()->create([
            'type' => $image->getClientOriginalExtension(),
            'path' => $path,
            'original_name' => $image->getClientOriginalName(),
            'mime_type' => $image->getClientMimeType(),
            'size' => $image->getSize(),
        ]);
    }

    protected function storeIcon(Request $request, Industry $industry): void
    {
        if (! $request->hasFile('icon')) {
            return;
        }

        if ($industry->iconMedia) {
            $this->deleteIcon($industry);
        }

        $icon = $request->file('icon');
        $filename = Str::uuid() . '.' . $icon->getClientOriginalExtension();
        $path = $icon->storeAs('industries', $filename, 'uploads');

        $industry->iconMedia()->create([
            'type' => $icon->getClientOriginalExtension(),
            'path' => $path,
            'original_name' => $icon->getClientOriginalName(),
            'mime_type' => $icon->getClientMimeType(),
            'size' => $icon->getSize(),
            'file_status' => 'icon',
        ]);
    }

    protected function deleteImage(Industry $industry): void
    {
        if (! $industry->media) {
            return;
        }

        $disk = Storage::disk('uploads');
        $media = $industry->media;

        if ($media->path && $disk->exists($media->path)) {
            $disk->delete($media->path);
        }

        $media->delete();
    }

    protected function deleteIcon(Industry $industry): void
    {
        if (! $industry->iconMedia) {
            return;
        }

        $disk = Storage::disk('uploads');
        $media = $industry->iconMedia;

        if ($media->path && $disk->exists($media->path)) {
            $disk->delete($media->path);
        }

        $media->delete();
    }
}
