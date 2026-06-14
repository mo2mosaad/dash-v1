<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Support\Str;

class Client extends Model
{
    protected $fillable = [
        'client_code',
        'name',
        'email',
        'phone',
        'agency',
        'currency',
        'notes',
        'contact_people',
        'created_by',
    ];

    protected function casts(): array
    {
        return [
            'contact_people' => 'array',
        ];
    }

    public static function nextClientCode(): string
    {
        $lastest_code = self::orderByDesc('id')->value('client_code');

        $code = Str::afterLast($lastest_code ?? 0, 'C_');

        $new_code = Str::padLeft(++$code, 5, '0');

        return "C_$new_code";
    }

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function media(): MorphMany
    {
        return $this->morphMany(Media::class, 'mediaable');
    }
}
