<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Quiz;
use Illuminate\Support\Facades\Auth;

class QuizController extends Controller
{
    public function getQuizByCategoryAndDifficulty($type, $difficulty)
    {
        $userId = null;
        if (Auth::check()) $userId = Auth::user()->id;
        return Quiz::where("type", $type)
            ->where("difficulty", $difficulty)
            ->join("question", "quiz.id", "=", "question.quizId")
            ->leftJoin("favorite", function ($join) use ($userId) {
                $join->on("quiz.id", "=", "favorite.quizId")
                    ->where("favorite.userId", "=", $userId);
            })
            ->select("quiz.id", "question.image", "favorite.id as favorite")
            ->where("order", 1)
            ->get();
    }

    public function getTrend($difficulty)
    {
        $userId = null;
        if (Auth::check()) $userId = Auth::user()->id;
        return Quiz::join("question", "quiz.id", "=", "question.quizId")
            ->leftJoin("favorite", function ($join) use ($userId) {
                $join->on("quiz.id", "=", "favorite.quizId")
                    ->where("favorite.userId", "=", $userId);
            })
            ->where("difficulty", $difficulty)
            ->select("quiz.id", "question.image", "favorite.id as favorite")
            ->where("order", 1)
            ->get()
            ->sortBy("use")
            ->slice(0, 8);
    }

    public function trend()
    {
        return view("quiz.template", [
            "easy" => $this->getTrend(0),
            "medium" => $this->getTrend(1),
            "hard" => $this->getTrend(2),
        ]);
    }

    public function divertissement()
    {
        return view("quiz.template", [
            "easy" => $this->getQuizByCategoryAndDifficulty(0, 0),
            "medium" => $this->getQuizByCategoryAndDifficulty(0, 1),
            "hard" => $this->getQuizByCategoryAndDifficulty(0, 2),
        ]);
    }

    public function apprentissage()
    {
        return view("quiz.template", [
            "easy" => $this->getQuizByCategoryAndDifficulty(1, 0),
            "medium" => $this->getQuizByCategoryAndDifficulty(1, 1),
            "hard" => $this->getQuizByCategoryAndDifficulty(1, 2),
        ]);
    }
}
