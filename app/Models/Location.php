<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    use HasFactory;

    protected $fillable = [
        'type',
        'block',
        'section',
        'row',
        'plot'
    ];

    protected $table = 'location';

    public function deceased()
    {
        return $this->hasMany(Deceased::class, 'Plot_ID', 'id');
    }
}