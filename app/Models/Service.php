<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Service extends Model
{
    protected $fillable = [
        'name',
        'icon',
        'description',
        'content',
        'status',
        // added by mohammed mosaad
        'title',
        'slug',
        'seo_title',
        'seo_description',
        'seo_keywords',
        'image_path',
    ];

    public function projectRequests(): BelongsToMany
    {
        return $this->belongsToMany(ProjectRequest::class, 'request_service');
    }

    public function freelancerPoServices(): BelongsToMany
    {
        return $this->belongsToMany(FreelancerPo::class, 'freelancer_po_service');
    }

    public function clientPoServices(): BelongsToMany
    {
        return $this->belongsToMany(ClientPo::class, 'client_po_service');
    }

    public function freelancers(): BelongsToMany
    {
        return $this->belongsToMany(Freelancer::class, 'freelancer_service');
    }
     public function tasks(): BelongsToMany
    {
        return $this->belongsToMany(Task::class, 'task_service');
    }
}
