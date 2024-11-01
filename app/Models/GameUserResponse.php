<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GameUserResponse extends Model
{
    use HasFactory;

    protected $table = "game_user_response";

    protected $fillable = [
        "responseId",
        "gameUserId",
        "questionId",
        "order"
    ];

    public function gameUser()
    {
        return $this->belongsTo(GameUser::class);
    }

    public function response()
    {
        return $this->belongsTo(Response::class);
    }
}
