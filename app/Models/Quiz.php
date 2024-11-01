<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
    use HasFactory;


    protected $table = 'quiz';
    protected $fillable = [
        'difficulty',
        'type',
        "use"
    ];

    public function question()
    {
        return $this->hasMany(Question::class);
    }

    public function favorite()
    {
        return $this->hasMany(Favorite::class);
    }
}
