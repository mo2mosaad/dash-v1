<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Traits\HasPermissions;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, HasPermissions, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'status',
        'role_id',
        'phone',
        'agency',
        'currency',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    public function role(): BelongsTo
    {
        return $this->belongsTo(Role::class);
    }

    public function createdTasks(): HasMany
    {
        return $this->hasMany(Task::class, 'created_by');
    }

    public function closedTasks(): HasMany
    {
        return $this->hasMany(Task::class, 'closed_by');
    }

    public function createdFreelancerPos(): HasMany
    {
        return $this->hasMany(FreelancerPo::class, 'created_by');
    }

    public function isAdministrator(): bool
    {
        return $this->role_id === 1;
    }

    /**
     * Get system account emails that should be excluded from lists
     */
    public static function getSystemAccountEmails(): array
    {
        return [
            'abdallhelzayat194@gmail.com',
            'abdallh@gmail.com',
        ];
    }

    /**
     * Check if user is a system account that should be hidden from lists
     */
    public function isSystemAccount(): bool
    {
        return in_array($this->email, self::getSystemAccountEmails());
    }

    public function isRoleAdmin(): bool
    {
       // return $this->role->id === 1;
      return (int) $this->role_id === 1;
    }

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
}
