<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Services extends Model
{
    use HasFactory;
    protected $fillable = [
        'titre',
        'description',
        'tarif',
        'date',
        'lieu',
        'user_id',
        'statut',
        'categorie_id',
        'photo',

    ];
    protected $table = 'services';
}
