<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Exécute les seeders de la base de données.
     *
     * @return void
     */
    public function run()
    {
        $this->call(QuizDivertissementEasySeeder::class);
        $this->call(QuizDivertissementMediumSeeder::class);
        $this->call(QuizDivertissementHardSeeder::class);
        $this->call(QuizApprentissageEasySeeder::class);
        $this->call(QuizApprentissageMediumSeeder::class);
        $this->call(QuizApprentissageHardSeeder::class);
    }
}
