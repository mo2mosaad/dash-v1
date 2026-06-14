<?php

namespace App\Providers;

use App\Models\Setting;
use Exception;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Schema::defaultStringLength(191);
        
        Paginator::useBootstrapFive();

        // Share settings with all website views
        View::composer('website.*', function ($view) {
            try {
                $settings = once(static fn () => Setting::pluck('value', 'key')->toArray());
            } catch (Exception $e) {
                $settings = [];
            }
            $view->with('settings', $settings);
        });
    }
}
