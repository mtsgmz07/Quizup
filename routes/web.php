<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\FavoriteController;
use App\Http\Controllers\QuizController;
use App\Http\Controllers\GameController;
use App\Http\Controllers\GameUserResponseController;
use App\Http\Controllers\HistoryController;
use App\Models\GameUserResponse;
use App\Models\History;
use App\Models\Game;

Route::get('/', function () {
    return view('homepage');
});

Route::get('/test', function () {
    $test = GameUserResponse::where("gameUserId", 95)
        ->join("response", "response.id", "=", "game_user_response.responseId")
        ->select("game_user_response.*", "response.*")
        ->get();
    $score = 0;
    $maptest = $test->map(function ($x) use (&$score) {
        if ($x->badAnswer === 0) {
            $score += 20;
        }
    });
    dd($score);
    return view('quiz.end');
});

Route::get('/quiz/divertissement', [QuizController::class, "divertissement"]);
Route::get('/quiz/apprentissage', [QuizController::class, "apprentissage"]);
Route::get('/quiz/trend', [QuizController::class, "trend"]);


Route::post('/quiz/game/join', [GameController::class, "join"])->name("join.game");
Route::post('/quiz/game/create', [GameController::class, "store"]);
Route::get('/quiz/game/{quizId}/{code}', [GameController::class, "game"]);
Route::post('/quiz/game/users', [GameController::class, "getAllUsers"]);
Route::post('/quiz/game/get/user', [GameController::class, "getAllUsers"]);
Route::post('/quiz/game/destroy', [GameController::class, "destroy"]);
Route::get('/quiz/game/leave', [GameController::class, "leave"]);
Route::post('/quiz/game/status', [GameController::class, "status"]);
Route::post('/quiz/game/launch', [GameController::class, "launch"]);
Route::post('/quiz/game/response', [GameUserResponseController::class, "store"]);


Route::post('/favorite/add', [FavoriteController::class, "store"]);
Route::post('/favorite/remove', [FavoriteController::class, "remove"]);

Route::get('/dashboard', function () {
    return view('dashboard', ["favorites" => (new FavoriteController())->show(), "historys" => (new HistoryController())->show()]);
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__ . '/auth.php';
