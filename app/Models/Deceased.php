<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Deceased extends Model
{
    use HasFactory;

    protected $table = 'deceased';

    public function location()
    {
        return $this->belongsTo(Location::class, 'Plot_ID', 'id');
    }
}