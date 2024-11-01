<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class QuestionController extends Controller
{
    public function __transform($question)
    {
        $motsArret = ["de", "quel", "le", "la", "les", "un", "une", "des", "du", "et", "à", "dans", "pour", "par", "avec", "en", "sur", "sous", "chez", "entre", "sans", "contre", "au", "aux", "ce", "cet", "cette", "ces", "qui", "que", "quoi", "dont", "où", "ne", "pas", "ni", "ou", "mais", "car", "donc", "or", "soit", "si", "même", "aussi", "ensuite", "alors", "dispose-t-il", "dispose"];

        $question = strtolower(preg_replace('/[.,?!;:]/', '', $question));
        $mots = explode(' ', $question);
        $motsPrincipaux = array_filter($mots, function ($mot) use ($motsArret) {
            return !in_array($mot, $motsArret);
        });
        return implode(' ', $motsPrincipaux);
    }
}
