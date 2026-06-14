<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\SettingRequest;
use App\Models\Setting;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Gate;
use Illuminate\View\View;

class SettingController extends Controller
{
    public function index(): View
    {
        Gate::authorize('View Setting');

        $settings = Setting::orderBy('label')->get();

        return view('dashboard.settings.index', compact('settings'));
    }

    public function edit(): View
    {
        Gate::authorize('Update Setting');

        $settings = Setting::orderBy('label')->get();

        return view('dashboard.settings.edit', compact('settings'));
    }

    public function update(SettingRequest $request): RedirectResponse
    {
        Gate::authorize('Update Setting');

        $validated = $request->validated();

        foreach ($validated as $key => $value) {
            Setting::set($key, $value);
        }

        return redirect()
            ->route('dashboard.settings.index')
            ->with('success', 'Settings updated successfully.');
    }
}
