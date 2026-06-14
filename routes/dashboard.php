<?php

use App\Http\Controllers\Dashboard\ClientController;
use App\Http\Controllers\Dashboard\ClientPartnerController;
use App\Http\Controllers\Dashboard\ClientPoController;
use App\Http\Controllers\Dashboard\CompanyCapitalController;
use App\Http\Controllers\Dashboard\ContactMessageController;
use App\Http\Controllers\Dashboard\ExpenseController;
use App\Http\Controllers\Dashboard\FinanceClientInvoiceController;
use App\Http\Controllers\Dashboard\FinanceFreelancerInvoiceController;
use App\Http\Controllers\Dashboard\FinanceController;
use App\Http\Controllers\Dashboard\FreelancerController;
use App\Http\Controllers\Dashboard\HomeController;
use App\Http\Controllers\Dashboard\IndustryController;
use App\Http\Controllers\Dashboard\IosImageController;
use App\Http\Controllers\Dashboard\PermissionController;
use App\Http\Controllers\Dashboard\ProjectRequestController;
use App\Http\Controllers\Dashboard\RevenueController;
use App\Http\Controllers\Dashboard\RoleController;
use App\Http\Controllers\Dashboard\ServiceController;
use App\Http\Controllers\Dashboard\SettingController;
use App\Http\Controllers\Dashboard\TaskController;
use App\Http\Controllers\Dashboard\TestimonialController;
use App\Http\Controllers\Dashboard\UserController;
use App\Http\Controllers\Dashboard\VendorPoController;

use App\Http\Controllers\Dashboard\PageController;
use App\Http\Controllers\Dashboard\ArticleController;
use App\Http\Controllers\Dashboard\CategoryController;

use Illuminate\Support\Facades\Route;

Route::prefix('dashboard')->middleware('auth')->as('dashboard.')->group(function () {

    Route::get('/', [HomeController::class, 'index'])->name('home');

    Route::prefix('finance')->as('finance.')->group(function () {
        Route::get('/', [FinanceController::class, 'index'])->name('index');
        Route::get('/invoices', [FinanceController::class, 'invoices'])->name('invoices');

        Route::prefix('invoices')->name('invoices.')->group(function () {
            // Finance invoices (separate tables)
            Route::get('finance-freelancer-invoices', [FinanceFreelancerInvoiceController::class, 'index'])->name('finance-freelancer-invoices');
            Route::get('finance-freelancer-invoices/create', [FinanceFreelancerInvoiceController::class, 'create'])->name('finance-freelancer-invoices.create');
            Route::get('finance-freelancer-invoices/create-from-po/{freelancerPo}', [FinanceFreelancerInvoiceController::class, 'create'])->name('finance-freelancer-invoices.create-from-po');
            Route::post('finance-freelancer-invoices', [FinanceFreelancerInvoiceController::class, 'store'])->name('finance-freelancer-invoices.store');
            Route::get('finance-freelancer-invoices/{financeFreelancerInvoice}', [FinanceFreelancerInvoiceController::class, 'show'])->name('finance-freelancer-invoices.show');
            Route::get('finance-freelancer-invoices/{financeFreelancerInvoice}/edit', [FinanceFreelancerInvoiceController::class, 'edit'])->name('finance-freelancer-invoices.edit');
            Route::put('finance-freelancer-invoices/{financeFreelancerInvoice}', [FinanceFreelancerInvoiceController::class, 'update'])->name('finance-freelancer-invoices.update');
            Route::get('finance-freelancer-invoices/{financeFreelancerInvoice}/download/{media}', [FinanceFreelancerInvoiceController::class, 'download'])->name('finance-freelancer-invoices.download');
            Route::delete('finance-freelancer-invoices/{financeFreelancerInvoice}/files/{media}', [FinanceFreelancerInvoiceController::class, 'destroyFile'])
                ->name('finance-freelancer-invoices.files.destroy');
            Route::delete('finance-freelancer-invoices/{financeFreelancerInvoice}', [FinanceFreelancerInvoiceController::class, 'destroy'])->name('finance-freelancer-invoices.destroy');

            Route::get('finance-client-invoices', [FinanceClientInvoiceController::class, 'index'])->name('finance-client-invoices');
            Route::get('finance-client-invoices/create', [FinanceClientInvoiceController::class, 'create'])->name('finance-client-invoices.create');
            Route::get('finance-client-invoices/create-from-po/{clientPo}', [FinanceClientInvoiceController::class, 'create'])->name('finance-client-invoices.create-from-po');
            Route::post('finance-client-invoices', [FinanceClientInvoiceController::class, 'store'])->name('finance-client-invoices.store');
            Route::get('finance-client-invoices/{financeClientInvoice}', [FinanceClientInvoiceController::class, 'show'])->name('finance-client-invoices.show');
            Route::get('finance-client-invoices/{financeClientInvoice}/edit', [FinanceClientInvoiceController::class, 'edit'])->name('finance-client-invoices.edit');
            Route::put('finance-client-invoices/{financeClientInvoice}', [FinanceClientInvoiceController::class, 'update'])->name('finance-client-invoices.update');
            Route::get('finance-client-invoices/{financeClientInvoice}/download/{media}', [FinanceClientInvoiceController::class, 'download'])->name('finance-client-invoices.download');
            Route::delete('finance-client-invoices/{financeClientInvoice}/files/{media}', [FinanceClientInvoiceController::class, 'destroyFile'])
                ->name('finance-client-invoices.files.destroy');
            Route::delete('finance-client-invoices/{financeClientInvoice}', [FinanceClientInvoiceController::class, 'destroy'])->name('finance-client-invoices.destroy');
        });

        Route::resource('revenues', RevenueController::class)->except(['show']);
        Route::post('revenues/{revenue}/sheet', [RevenueController::class, 'uploadSheet'])
            ->name('revenues.sheet.store');
        Route::get('revenues/{revenue}/sheet/{media?}', [RevenueController::class, 'downloadSheet'])
            ->name('revenues.sheet.download');
        Route::delete('revenues/{revenue}/sheet/{media}', [RevenueController::class, 'destroySheet'])
            ->name('revenues.sheet.destroy');

        Route::resource('expenses', ExpenseController::class)->except(['show']);
        Route::post('expenses/{expense}/sheet', [ExpenseController::class, 'uploadSheet'])
            ->name('expenses.sheet.store');
        Route::get('expenses/{expense}/sheet/{media?}', [ExpenseController::class, 'downloadSheet'])
            ->name('expenses.sheet.download');
        Route::delete('expenses/{expense}/sheet/{media}', [ExpenseController::class, 'destroySheet'])
            ->name('expenses.sheet.destroy');

        Route::get('company-capital', [CompanyCapitalController::class, 'index'])->name('company-capital.index');
        Route::get('company-capital/edit', [CompanyCapitalController::class, 'edit'])->name('company-capital.edit');
        Route::put('company-capital', [CompanyCapitalController::class, 'update'])->name('company-capital.update');
    });

    // Users Routes
    Route::resource('/users', UserController::class);

    // Roles Routes
    Route::resource('/roles', RoleController::class);

    // Permissions Routes
    Route::resource('/permissions', PermissionController::class);

    // Clients Routes
    Route::resource('/clients', ClientController::class);

    Route::get('/clients/{client}/attachments/{media}', [ClientController::class, 'downloadAttachment'])
        ->name('clients.attachments.download');

    Route::delete('/clients/{client}/attachments/{media}', [ClientController::class, 'destroyAttachment'])
        ->name('clients.attachments.destroy');

    // Freelancers Routes
    Route::resource('/freelancers', FreelancerController::class);
    Route::get('/freelancers/{freelancer}/attachments/{media}', [FreelancerController::class, 'downloadAttachment'])
        ->name('freelancers.attachments.download');
    Route::delete('/freelancers/{freelancer}/attachments/{media}', [FreelancerController::class, 'destroyAttachment'])
        ->name('freelancers.attachments.destroy');

    // Services Routes
    // Route::resource('/services', ServiceController::class);
    Route::resource('/client-partners', ClientPartnerController::class);


    // --- CMS Management ---
    Route::resource('pages', PageController::class);
    Route::resource('articles', ArticleController::class);
    Route::resource('categories', \App\Http\Controllers\Dashboard\CategoryController::class);
    Route::resource('services', ServiceController::class);
    


    // Industries Routes
    Route::resource('/industries', IndustryController::class);

    // Tasks Routes
    Route::get('/tasks/find-client-or-freelancer', [TaskController::class, 'findClientOrFreelancer'])
        ->name('tasks.find-client-or-freelancer');
    Route::get('/tasks/find-task', [TaskController::class, 'findTask'])
        ->name('tasks.find-task');
    Route::post('/tasks/{task}/upload-files', [TaskController::class, 'uploadFiles'])
        ->name('tasks.upload-files');
    Route::post('/tasks/{task}/attachments', [TaskController::class, 'storeAttachment'])
        ->name('tasks.attachments.store');
    Route::get('/tasks/{task}/attachments/{media}', [TaskController::class, 'downloadAttachment'])
        ->name('tasks.attachments.download');
    Route::delete('/tasks/{task}/attachments/{media}', [TaskController::class, 'destroyAttachment'])
        ->name('tasks.attachments.destroy');
    Route::resource('/tasks', TaskController::class);

    Route::prefix('/tasks/{task}')->name('tasks.')->scopeBindings()->group(function () {
        Route::get('vendor-pos', [VendorPoController::class, 'index'])->name('vendor-pos.index');
        Route::get('vendor-pos/create', [VendorPoController::class, 'create'])->name('vendor-pos.create');
        Route::post('vendor-pos', [VendorPoController::class, 'store'])->name('vendor-pos.store');
        Route::get('vendor-pos/{vendorPo}/edit', [VendorPoController::class, 'edit'])->name('vendor-pos.edit');
        Route::patch('vendor-pos/{vendorPo}', [VendorPoController::class, 'update'])->name('vendor-pos.update');
        Route::get('vendor-pos/{vendorPo}/download', [VendorPoController::class, 'download'])->name('vendor-pos.download');
        Route::delete('vendor-pos/{vendorPo}/file', [VendorPoController::class, 'destroyFile'])->name('vendor-pos.file.destroy');
        Route::delete('vendor-pos/{vendorPo}', [VendorPoController::class, 'destroy'])->name('vendor-pos.destroy');

        Route::get('client-pos', [ClientPoController::class, 'index'])->name('client-pos.index');
        Route::get('client-pos/create', [ClientPoController::class, 'create'])->name('client-pos.create');
        Route::post('client-pos', [ClientPoController::class, 'store'])->name('client-pos.store');
        Route::get('client-pos/{clientPo}/edit', [ClientPoController::class, 'edit'])->name('client-pos.edit');
        Route::patch('client-pos/{clientPo}', [ClientPoController::class, 'update'])->name('client-pos.update');
        Route::get('client-pos/{clientPo}/download', [ClientPoController::class, 'download'])->name('client-pos.download');
        Route::delete('client-pos/{clientPo}/file', [ClientPoController::class, 'destroyFile'])->name('client-pos.file.destroy');
        Route::delete('client-pos/{clientPo}', [ClientPoController::class, 'destroy'])->name('client-pos.destroy');
    });

    // show single task,client,freelancer
    Route::get('freelancer/{freelancer:freelancer_code}', [FreelancerController::class, 'show'])->name('freelancer.invoice.show');
    Route::get('task/{task:task_number}', [TaskController::class, 'show'])->name('task.invoice.show');
    Route::get('client/{client:client_code}', [ClientController::class, 'show'])->name('client.invoice.show');

    // Testimonials Routes
    Route::resource('/testimonials', TestimonialController::class)->except(['show']);

    // Contact Messages Routes
    Route::resource('/contact-messages', ContactMessageController::class)->only(['index', 'show', 'destroy']);

    // IOS Images Routes
    Route::resource('/ios-images', IosImageController::class)->except(['show']);

    // Project Requests Routes
    Route::get('/project-requests', [ProjectRequestController::class, 'index'])
        ->name('project-requests.index');

    Route::get('/project-requests/{projectRequest}', [ProjectRequestController::class, 'show'])
        ->name('project-requests.show');

    Route::get('/project-requests/{projectRequest}/attachments/{media}', [ProjectRequestController::class, 'downloadAttachment'])
        ->name('project-requests.attachments.download');

    Route::delete('/project-requests/{projectRequest}/attachments/{media}', [ProjectRequestController::class, 'destroyAttachment'])
        ->name('project-requests.attachments.destroy');

    Route::post('/project-requests/{projectRequest}/attachments', [ProjectRequestController::class, 'storeAttachment'])
        ->name('project-requests.attachments.store');

    Route::patch('/project-requests/{projectRequest}/status', [ProjectRequestController::class, 'updateStatus'])
        ->name('project-requests.update-status');

    Route::delete('/project-requests/{projectRequest}', [ProjectRequestController::class, 'destroy'])
        ->name('project-requests.destroy');

    // Settings Routes
    Route::get('/settings', [SettingController::class, 'index'])->name('settings.index');
    Route::get('/settings/edit', [SettingController::class, 'edit'])->name('settings.edit');
    Route::put('/settings', [SettingController::class, 'update'])->name('settings.update');
});
