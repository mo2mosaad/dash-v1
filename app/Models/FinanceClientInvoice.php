<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphMany;

class FinanceClientInvoice extends Model
{
    protected $table = 'finance_client_invoices';

    protected $fillable = [
        'task_code',
        'client_code',
        'date_20',
        'date_80',
        'payment_20',
        'payment_80',
        'total_price',
        'note',
        'status',
    ];

    protected function casts(): array
    {
        return [
            'date_20' => 'date',
            'date_80' => 'date',
            'payment_20' => 'decimal:2',
            'payment_80' => 'decimal:2',
            'total_price' => 'decimal:2',
        ];
    }

    public function media(): MorphMany
    {
        return $this->morphMany(Media::class, 'mediaable');
    }
}
