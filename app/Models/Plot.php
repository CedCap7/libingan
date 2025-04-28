<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Plot extends Model
{
    protected $table = 'location';

    public function deceased()
    {
        return $this->hasMany(Deceased::class);
    }
} 