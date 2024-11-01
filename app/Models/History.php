<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class History extends Model
{
    use HasFactory;

    protected $table = "history";
    protected $fillable = [
        "userId",
        "quizId"
    ];

    public function quiz()
    {
        return $this->hasMany(Quiz::class);
    }
}
