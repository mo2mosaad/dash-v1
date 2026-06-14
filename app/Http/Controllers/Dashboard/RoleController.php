<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Permission;
use App\Models\Role;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Illuminate\View\View;

class RoleController extends Controller
{
    public function index(): View
    {
        Gate::authorize('View Role');

        $roles = Role::with('permissions')->latest()->paginate(10);

        return view('dashboard.pages.roles.index', compact('roles'));
    }

    public function create(): View
    {
        Gate::authorize('Create Role');

        $permissions = Permission::all();

        return view('dashboard.pages.roles.create', compact('permissions'));
    }

    public function store(Request $request): RedirectResponse
    {
        Gate::authorize('Create Role');

        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:roles,name',
            'permissions' => 'nullable|array',
            'permissions.*' => 'exists:permissions,id',
        ]);

        $role = Role::create([
            'name' => $validated['name'],
        ]);

        if (isset($validated['permissions'])) {
            $role->permissions()->attach($validated['permissions']);
        }

        return redirect()->route('dashboard.roles.index')
            ->with('success', 'Role created successfully.');
    }

    public function edit(Role $role): View
    {
        Gate::authorize('Update Role');

        $permissions = Permission::all();
        $rolePermissions = $role->permissions->pluck('id')->toArray();

        return view('dashboard.pages.roles.edit', compact('role', 'permissions', 'rolePermissions'));
    }

    public function update(Request $request, Role $role): RedirectResponse
    {
        Gate::authorize('Update Role');

        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:roles,name,' . $role->id,
            'permissions' => 'nullable|array',
            'permissions.*' => 'exists:permissions,id',
        ]);

        $role->update([
            'name' => $validated['name'],
        ]);

        $role->permissions()->sync($validated['permissions'] ?? []);

        return redirect()->route('dashboard.roles.index')
            ->with('success', 'Role updated successfully.');
    }

    public function destroy(Role $role): RedirectResponse
    {
        Gate::authorize('Delete Role');

        // Prevent deleting admin role (id = 1)
        if ($role->id === 1) {
            return redirect()->route('dashboard.roles.index')
                ->with('error', 'Cannot delete Admin role.');
        }

        // Prevent deleting role if it has associated users
        $usersCount = $role->users()->count();
        if ($usersCount > 0) {
            return redirect()->route('dashboard.roles.index')
                ->with('error', "Cannot delete role. There are {$usersCount} user(s) assigned to this role. Please reassign or delete those users first.");
        }

        $role->permissions()->detach();
        $role->delete();

        return redirect()->route('dashboard.roles.index')
            ->with('success', 'Role deleted successfully.');
    }
}
