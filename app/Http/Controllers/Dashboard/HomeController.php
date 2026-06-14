<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Client;
use App\Models\ContactMessage;
use App\Models\Expense;
use App\Models\Freelancer;
use App\Models\ProjectRequest;
use App\Models\Revenue;
use App\Models\Task;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        $isAdmin = $user->isAdministrator();

        if ($isAdmin) {
            return $this->adminDashboard();
        }

        return $this->userDashboard($user);
    }

    protected function adminDashboard()
    {
        // Users Statistics (excluding system accounts)
        $excludedEmails = User::getSystemAccountEmails();

        $totalUsers = User::whereNotIn('email', $excludedEmails)->count();
        $activeUsers = User::whereNotIn('email', $excludedEmails)
            ->where('status', 'active')
            ->count();

        // Tasks Statistics
        $totalTasks = Task::count();
        $pendingTasks = Task::where('status', 'pending')->count();
        $inProgressTasks = Task::where('status', 'in_progress')->count();
        $completedTasks = Task::where('status', 'completed')->count();

        // Clients Statistics
        $totalClients = Client::count();

        // Freelancers Statistics
        $totalFreelancers = Freelancer::count();

        // Project Requests Statistics
        $totalProjectRequests = ProjectRequest::count();
        $pendingProjectRequests = ProjectRequest::where('status', 'pending')->count();

        // Contact Messages Statistics
        $totalContactMessages = ContactMessage::count();
        $recentContactMessages = ContactMessage::where('created_at', '>=', now()->subDays(7))->count();

        // Financial Statistics
        $totalRevenueUsd = Revenue::sum('total_usd') ?? 0;
        $totalRevenueEgp = Revenue::sum('total_egp') ?? 0;
        $totalExpenseUsd = Expense::sum('total_usd') ?? 0;
        $totalExpenseEgp = Expense::sum('total_egp') ?? 0;
        $netProfitUsd = $totalRevenueUsd - $totalExpenseUsd;
        $netProfitEgp = $totalRevenueEgp - $totalExpenseEgp;

        // Recent Activity
        $recentTasks = Task::with('creator')
            ->latest()
            ->limit(5)
            ->get(['id', 'task_number', 'status', 'created_at', 'created_by']);

        $recentProjectRequests = ProjectRequest::latest()
            ->limit(5)
            ->get(['id', 'project_name', 'email', 'status', 'created_at']);

        return view('dashboard.pages.home', [
            'isAdmin' => true,
            // Users
            'totalUsers' => $totalUsers,
            'activeUsers' => $activeUsers,
            // Tasks
            'totalTasks' => $totalTasks,
            'pendingTasks' => $pendingTasks,
            'inProgressTasks' => $inProgressTasks,
            'completedTasks' => $completedTasks,
            // Clients & Freelancers
            'totalClients' => $totalClients,
            'totalFreelancers' => $totalFreelancers,
            // Project Requests
            'totalProjectRequests' => $totalProjectRequests,
            'pendingProjectRequests' => $pendingProjectRequests,
            // Contact Messages
            'totalContactMessages' => $totalContactMessages,
            'recentContactMessages' => $recentContactMessages,
            // Financial
            'totalRevenueUsd' => $totalRevenueUsd,
            'totalRevenueEgp' => $totalRevenueEgp,
            'totalExpenseUsd' => $totalExpenseUsd,
            'totalExpenseEgp' => $totalExpenseEgp,
            'netProfitUsd' => $netProfitUsd,
            'netProfitEgp' => $netProfitEgp,
            // Recent Activity
            'recentTasks' => $recentTasks,
            'recentProjectRequests' => $recentProjectRequests,
        ]);
    }

    protected function userDashboard(User $user)
    {
        // Get user's available permissions/tabs
        $availableTabs = collect($this->getAvailableTabs($user));

        // Get user's tasks if they have permission
        $userTasks = collect();
        if ($user->hasPermission('View Task')) {
            $userTasks = Task::where('created_by', $user->id)
                ->latest()
                ->limit(5)
                ->get(['id', 'task_number', 'status', 'created_at']);
        }

        return view('dashboard.pages.home', [
            'isAdmin' => false,
            'user' => $user,
            'availableTabs' => $availableTabs,
            'userTasks' => $userTasks,
        ]);
    }

    protected function getAvailableTabs(User $user): array
    {
        $tabs = [];

        // Define all possible tabs with their permissions
        $allTabs = [
            [
                'name' => 'Tasks',
                'icon' => 'ti ti-checklist',
                'route' => 'dashboard.tasks.index',
                'permission' => 'View Task',
                'description' => 'Manage and track your tasks',
            ],
            [
                'name' => 'Clients',
                'icon' => 'ti ti-address-book',
                'route' => 'dashboard.clients.index',
                'permission' => 'View Client',
                'description' => 'View and manage clients',
            ],
            [
                'name' => 'Freelancers',
                'icon' => 'ti ti-user-star',
                'route' => 'dashboard.freelancers.index',
                'permission' => 'View Freelancer',
                'description' => 'View and manage freelancers',
            ],
            [
                'name' => 'Services',
                'icon' => 'ti ti-briefcase',
                'route' => 'dashboard.services.index',
                'permission' => 'View Service',
                'description' => 'Browse available services',
            ],
            [
                'name' => 'Industries',
                'icon' => 'ti ti-building',
                'route' => 'dashboard.industries.index',
                'permission' => 'View Industry',
                'description' => 'View industries',
            ],
            [
                'name' => 'Project Requests',
                'icon' => 'ti ti-file-dollar',
                'route' => 'dashboard.project-requests.index',
                'permission' => 'View Project Request',
                'description' => 'View project requests',
            ],
            [
                'name' => 'Contact Messages',
                'icon' => 'ti ti-mail',
                'route' => 'dashboard.contact-messages.index',
                'permission' => 'View Contact Message',
                'description' => 'View contact messages',
            ],
            [
                'name' => 'Finance',
                'icon' => 'ti ti-wallet',
                'route' => 'dashboard.finance.invoices',
                'permission' => 'View Finance',
                'description' => 'View financial information',
            ],
            [
                'name' => 'Settings',
                'icon' => 'ti ti-settings',
                'route' => 'dashboard.settings.index',
                'permission' => 'View Setting',
                'description' => 'Manage website settings',
            ],
        ];

        // Filter tabs based on user permissions
        foreach ($allTabs as $tab) {
            if ($user->hasPermission($tab['permission'])) {
                $tabs[] = $tab;
            }
        }

        return $tabs;
    }
}
