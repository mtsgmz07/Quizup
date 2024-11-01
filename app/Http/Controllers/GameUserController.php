<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\GameUser;
use App\Models\Game;

class GameUserController extends Controller
{
    public function myStatus()
    {
        if (!Auth::check() && !session("gameUserId")) return false;

        $getGameUser = Auth::check() ?
            GameUser::where("userId", Auth::user()->id)->first() :
            GameUser::where("id", session("gameUserId"))->first();

        if (Game::find($getGameUser->gameId) === null) return false;
        return [
            "status" => $getGameUser->status,
            "launch" => $getGameUser->launch,
            "gameId" => $getGameUser->gameId,
            "userId" => $getGameUser->id
        ];
    }

    public function launch()
    {
        if (!Auth::check() && !session("gameUserId")) return false;

        $getGameUser = Auth::check() ?
            GameUser::where("userId", Auth::user()->id)->first() :
            GameUser::where("id", session("gameUserId"))->first();

        if (Game::find($getGameUser->gameId) === null) return false;
        $getGameUser->launch = true;
        $getGameUser->save();
        return true;
    }

    public function updateStatus()
    {
        if (!Auth::check() && !session("gameUserId")) return false;

        $getGameUser = Auth::check() ?
            GameUser::where("userId", Auth::user()->id)->first() :
            GameUser::where("id", session("gameUserId"))->first();

        if (Game::find($getGameUser->gameId) === null) return false;

        $getGameUser->status = $getGameUser->status + 1;
        $getGameUser->save();
        return true;
    }
}
