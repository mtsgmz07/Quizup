<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\GameUserResponse;
use App\Models\Question;
use App\Models\Response;
use App\Http\Controllers\GameUserController;

class GameUserResponseController extends Controller
{

    private $GameUserController;

    public function __construct()
    {
        $this->GameUserController = new GameUserController();
    }


    public function store(Request $request)
    {
        $getUser = $this->GameUserController->myStatus();
        if (!$getUser) return response()->json([
            "message" => "Access denined",
            "status" => "access-denied"
        ], 404);

        $checkAlreadyExist = GameUserResponse::where("order", $getUser["status"]);

        if ($checkAlreadyExist->exists()) return response()->json([
            "message" => "Already answered",
            "status" => "already-answered"
        ], 404);

        $getQuesion = Response::find($request->responseId);

        if (!$getQuesion->exists()) return response()->json([
            "message" => "ERROR 404",
            "status" => "404"
        ], 404);

        GameUserResponse::create([
            "responseId" => $request->responseId,
            "questionId" => $getQuesion->questionId,
            "gameUserId" => $getUser["userId"],
            "order" => $getUser["status"]
        ]);
    }
}
