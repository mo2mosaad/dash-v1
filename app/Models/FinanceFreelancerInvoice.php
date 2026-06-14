<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphMany;

class FinanceFreelancerInvoice extends Model
{
    protected $table = 'finance_freelancer_invoices';

    protected $fillable = [
        'freelancer_code',
        'task_code',
        'project_name',
        'page_number',
        'price',
        'start_date',
        'payment_date',
        'note',
        'status',
    ];

    protected function casts(): array
    {
        return [
            'start_date' => 'date',
            'payment_date' => 'date',
            'price' => 'decimal:2',
        ];
    }

    public function media(): MorphMany
    {
        return $this->morphMany(Media::class, 'mediaable');
    }
}
