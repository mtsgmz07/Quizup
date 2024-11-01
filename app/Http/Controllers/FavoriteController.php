<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Favorite;
use Illuminate\Support\Facades\Auth;

class FavoriteController extends Controller
{
    public function store(Request $request)
    {
        if (Auth::check()) {
            $checkFavorite = Favorite::where("userId", Auth::user()->id)->where("quizId", $request->quizId)->get();
            if (!$checkFavorite->isEmpty()) return response()->json([
                'message' => 'Favorite already added',
                'status' => 'favorite-already-added',
            ], 404);
            Favorite::create([
                'quizId' => $request->quizId,
                "userId" => Auth::user()->id,
            ]);
            return response()->json([
                'message' => 'Favorite added',
                'status' => 'favorite-added'
            ], 200);
        } else return response()->json([
            'message' => 'Account required',
            'status' => 'account-required',
        ], 404);
    }

    public function remove(Request $request)
    {
        if (Auth::check()) {
            $checkFavorite = Favorite::where("userId", Auth::user()->id)->where("quizId", $request->quizId)->get();
            if ($checkFavorite->isEmpty()) return response()->json([
                'message' => 'Favorite not added',
                'status' => 'favorite-not-added',
            ], 404);
            Favorite::where("userId", Auth::user()->id)->where("quizId", $request->quizId)->delete();
            return response()->json([
                'message' => 'Favorite deleted',
                'status' => 'favorite-deleted',
                "length" => Favorite::where("userId", Auth::user()->id)->count()
            ], 200);
        } else return response()->json([
            'message' => 'Account required',
            'status' => 'account-required',
        ], 404);
    }

    public function show()
    {
        return Favorite::where("userId", Auth::user()->id)
            ->join("quiz", "favorite.quizId", "=", "quiz.id")
            ->join("question", "quiz.id", "=", "question.quizId")
            ->select("favorite.id", "quiz.id", "question.image")
            ->where("order", 1)
            ->get()
            ->sortBy("created_at")
            ->slice(0, 4);
    }
}
