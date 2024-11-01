<?php

namespace App\Jobs;

use App\Models\Game;
use App\Models\History;
use App\Models\GameUser;
use App\Models\Quiz;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class GameManager implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $gameId;
    /**
     * Create a new job instance.
     */
    public function __construct($gameId)
    {
        $this->gameId = $gameId;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $getGame = Game::find($this->gameId)->first();
        sleep(20);

        $getGame->status = 1;
        $getGame->save();

        sleep(20);

        $getGame->status = 2;
        $getGame->save();

        sleep(20);

        $getGame->status = 3;
        $getGame->save();

        sleep(20);

        $getGame->status = 4;
        $getGame->save();

        sleep(20);

        $getAllUsers = GameUser::where("gameId", $this->gameId)->get();
        foreach ($getAllUsers as $user) {
            if (isset($user["userId"])) {
                History::create([
                    "userId" => $user["userId"],
                    "quizId" => Game::find($user["gameId"])->quizId
                ]);
            } else return;
        }

        $getGame->status = 5;
        $getGame->save();

        $getQuiz = Quiz::find($getGame->quizId);
        $getQuiz->use = $getQuiz->use + 1;
        $getQuiz->save();

        if(session("gameUserId")) session()->forget("gameUserId");
        sleep(10);
        $getGame->delete();
    }
}
