<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GameUser extends Model
{
    use HasFactory;

    protected $table = "game_user";

    public function game()
    {
        return $this->belongsTo(Game::class);
    }

    protected $fillable = [
        "gameId",
        "status",
        "nickname",
        "userId"
    ];
}
