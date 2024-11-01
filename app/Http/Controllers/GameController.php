<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Game;
use App\Models\Quiz;
use App\Models\GameUser;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Queue;
use App\Jobs\GameManager;
use App\Http\Controllers\GameUserController;
use App\Models\GameUserResponse;

class GameController extends Controller
{
    private $GameUserController;

    public function __construct()
    {
        $this->GameUserController = new GameUserController();
    }
    public function generate_code($length)
    {
        $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $charactersLength = strlen($characters);
        $randomString = '';

        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }

        return $randomString;
    }
    public function store(Request $request)
    {
        $quizId = $request->quizId;
        if (!Auth::check())
            return response()->json([
                'message' => 'User not connected',
                'status' => 'user-not-connected',
                "url" => "/login",
            ], 404);
        if (Quiz::where("id", $quizId)->get()->isEmpty())
            return response()->json([
                'message' => 'Quiz not find',
                'status' => 'quiz-not-find'
            ], 404);
        $code = $this->generate_code(8);
        $game = Game::create([
            "code" => $code,
            "quizId" => $quizId,
            "hostId" => Auth::user()->id,
            "status" => 0
        ]);
        GameUser::create([
            "gameId" => $game->id,
            "status" => 0,
            "nickname" => Auth::user()->nickname,
            "userId" => Auth::user()->id
        ]);
        return response()->json([
            'message' => 'Quiz find',
            'status' => 'quiz-find',
            "url" => "/quiz/game/$quizId/$code",
        ], 200);
    }

    public function game($quizId, $code)
    {
        if (Game::where("code", $code)->get()->isEmpty()) return redirect("/");
        if (Auth::check()) {
            if (Game::where("code", $code)->first()->status === 5) {
                $getUser = $this->GameUserController->myStatus();
                $getAllResponse = GameUserResponse::where("gameUserId", $getUser["userId"])
                    ->join("response", "response.id", "=", "game_user_response.responseId")
                    ->select("game_user_response.*", "response.*")
                    ->get();
                $score = 0;
                $getAllResponse->map(function ($x) use (&$score) {
                    if ($x->badAnswer === 0) {
                        $score += 20;
                    }
                });
                return view("quiz.end", ["score" => $score]);
            }
            if (Game::where("code", $code)->first()->launch === 1) return view("quiz.game");
            if (Game::where("code", $code)->first()->hostId === Auth::user()->id)
                return view(
                    "quiz/host",
                    [
                        "code" => $code,
                        "userId" => Auth::user()->id,
                        "nickname" => Auth::user()->nickname,
                        "host" => true
                    ]
                );
            else return view("quiz/home", ["nickname" => Auth::user()->nickname]);
        } else if (session('gameUserId')) {
            $getGameUserById = GameUser::find(session('gameUserId'));
            if (Game::find($getGameUserById->gameId)->code === $code) {
                if (Game::where("code", $code)->first()->launch === 1) return view("quiz.game");
                return view("quiz/home", ["nickname" => $getGameUserById->nickname]);
            } else return redirect("/");
        } else return redirect("/");
    }

    public function getAllUsers()
    {
        if (Auth::check()) {
            $findHost = Game::where("hostId", Auth::user()->id)->get();
            if ($findHost->isEmpty())
                return response()->json([
                    'message' => 'Access denied',
                    'status' => 'access-denied',
                ], 404);
            return response()->json([
                "message" => "All user of game",
                "data" => GameUser::where("gameId", $findHost->first()->id)->select("game_user.nickname")->get()
            ], 200);
        } else
            return response()->json([
                'message' => 'Access denied',
                'status' => 'access-denied',
            ], 404);
    }

    public function destroy()
    {
        if (Auth::check()) {
            $findHost = Game::where("hostId", Auth::user()->id)->first();
            if (!$findHost)
                return response()->json([
                    'message' => 'Access denied',
                    'status' => 'access-denied',
                ], 404);

            $findHost->delete();

            return response()->json([
                "message" => "Game deleted",
                "status" => "game-deleted",
            ], 200);
        } else
            return response()->json([
                'message' => 'Access denied',
                'status' => 'access-denied',
            ], 404);
    }

    public function status()
    {
        $userStatus = $this->GameUserController->myStatus();
        if (!$this->GameUserController->myStatus()) return response()->json([
            "message" => "Access denied",
            "status" => "access-denied"
        ]);

        if (Game::find($userStatus["gameId"])->status === 5) return response()->json([
            "message" => "Status game",
            "end" => true,
        ]);

        $getGame = Game::find($userStatus["gameId"])
            ->join("question", function ($join) {
                $join->on("question.quizId", "=", "game.quizId")
                    ->on("question.order", "=", "game.status");
            })->join("response", "response.questionId", "=", "question.id")
            ->select("game.launch", "game.status", "question.label", "question.image", "response.value", "response.id")
            ->get();

        if ($getGame->first()->launch === 0) return response()->json([
            "message" => "Status game",
            "launch" => false,
        ]);

        if ($getGame->first()->launch !== $userStatus["launch"]) {
            $this->GameUserController->launch();
            return response()->json([
                "message" => "Status game",
                "launch" => true
            ]);
        } else if ($getGame->first()->status !== $userStatus["status"]) {
            $this->GameUserController->updateStatus();
            return response()->json([
                "message" => "Status game",
                "next" => true,
                "question" => $getGame->first()->label,
                "image" => $getGame->first()->image,
                "responses" => $getGame->map(function ($x) {
                    return ["response_value" => $x->value, "response_id" => $x->id];
                })
            ]);
        } else return response()->json([
            "message" => "Status game",
            "question" => $getGame->first()->label,
            "image" => $getGame->first()->image,
            "responses" => $getGame->map(function ($x) {
                return ["response_value" => $x->value, "response_id" => $x->id];
            })
        ]);
    }

    public function join(Request $request)
    {
        $getGame = Game::where("code", $request->code)->first();
        if (!$getGame)
            return redirect("/");
        $quizId = $getGame->quizId;
        $code = $getGame->code;
        if (session("gameUserId")) {
            $getUser = GameUser::find(session("gameUserId"));
            if (!$getUser) session()->forget("gameUserId");
            if ($getUser && $getUser->gameId === $getGame->id)
                return redirect("/quiz/game/$quizId/$code");
            else
                return redirect("/");
        } else {
            $gameUser = GameUser::create([
                "gameId" => $getGame->first()->id,
                "status" => 0,
                "nickname" => Auth::check() ? Auth::user()->nickname : "Anonyme" . $this->generate_code(4),
                "userId" => Auth::check() ? Auth::user()->id : null,
            ]);
            if (!Auth::check()) session()->put("gameUserId", $gameUser->id);
            return redirect("/quiz/game/$quizId/$code");
        }
    }

    public function leave()
    {
        if (!Auth::check() && !session("gameUserId")) return redirect("/");

        $getGameUser = Auth::check() ?
            GameUser::where("userId", Auth::user()->id)->first() :
            GameUser::where("id", session("gameUserId"))->first();

        if ($getGameUser === null) return redirect("/");

        $getGame = Game::find($getGameUser->gameId)->first();

        if (Auth::check() && Auth::user()->id === $getGame->hostId) {
            $this->destroy();
            return redirect("/");
        } else {
            GameUser::find(session("gameUserId"))->delete();
            session()->forget("gameUserId");
            return redirect("/");
        }
    }

    function launch()
    {
        if (Auth::check()) {
            $findHost = Game::where("hostId", Auth::user()->id)->first();
            if (!$findHost) return response()->json([
                'message' => 'Access denied',
                'status' => 'access-denied',
            ], 404);

            if ($findHost->launch) return response()->json([
                'message' => 'Already launched',
                'status' => 'already-launched',
            ], 404);

            GameManager::dispatch($findHost->id);
            $findHost->launch = true;
            $findHost->save();
            $this->status();
            return response()->json([
                'message' => 'Game launched',
                'status' => 'game-launched',
            ], 200);
        } else return response()->json([
            "message" => "Access denied",
            "status" => "access-denied"
        ]);
    }
}
