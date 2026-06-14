<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphOne;
use Illuminate\Database\Eloquent\Relations\MorphMany;

class Industry extends Model
{
    protected $fillable = [
        'name', 
        'slug',
        'description',
        'content',
    ];

    public function media(): MorphOne
    {
        return $this->morphOne(Media::class, 'mediaable');
    }

    public function iconMedia(): MorphOne
    {
        return $this->morphOne(Media::class, 'mediaable')->where('file_status', 'icon');
    }
}
