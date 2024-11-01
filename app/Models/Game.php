<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Game extends Model
{
    use HasFactory;

    protected $table = "game";

    protected $fillable = [
        "code",
        "quizId",
        "status",
        "hostId",
        "launch"
    ];

    public function question()
    {
        return $this->hasMany(Question::class);
    }

    public function response()
    {
        return $this->hasMany(Response::class);
    }
}
