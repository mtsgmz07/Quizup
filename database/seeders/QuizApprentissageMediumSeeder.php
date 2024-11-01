<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\ApiController;
use App\Http\Controllers\QuestionController;

class QuizApprentissageMediumSeeder extends Seeder
{
    private $api;
    private $questionController;

    public function __construct()
    {
        $this->api = new ApiController();
        $this->questionController = new QuestionController();
    }
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($quiz = 0; $quiz < 8; $quiz++) {
            $newQuiz = $this->api->getQuiz("art_litterature")->getData(true)["data"];
            $newQuizId = DB::table("quiz")->insertGetId(["difficulty" => 1, "type" => 1]);

            for ($question = 0; $question < 5; $question++) {
                $getImage = $this->api->getImage($this->questionController->__transform($newQuiz[$question]["question"]))->getData(true);
                if(isset($getImage["data"])) $getImage = $getImage["data"];
                else $getImage = "https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg";
                $newQuestionId = DB::table("question")->insertGetId([
                    "quizId" => $newQuizId,
                    "label" => $newQuiz[$question]["question"],
                    "image" => $getImage,
                    "order" => $question
                ]);

                DB::table("response")->insert([
                    "questionId" => $newQuestionId,
                    "value" => $newQuiz[$question]["answer"],
                    "badAnswer" => false
                ]);

                foreach ($newQuiz[$question]["badAnswers"] as $badAnswer) {
                    DB::table("response")->insert([
                        "questionId" => $newQuestionId,
                        "value" => $badAnswer,
                        "badAnswer" => true
                    ]);
                }
            }
        }
    }
}
