<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\History;
use Illuminate\Support\Facades\Auth;


class HistoryController extends Controller
{
    public function show()
    {
        return History::where("userId", Auth::user()->id)
            ->join("quiz", "history.quizId", "=", "quiz.id")
            ->join("question", "quiz.id", "=", "question.quizId")
            ->select("history.id", "quiz.id", "question.image")
            ->where("order", 1)
            ->get()
            ->sortBy("created_at")
            ->slice(0, 4);
    }
}
