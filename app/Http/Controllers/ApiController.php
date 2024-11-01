<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;

class ApiController extends Controller
{
    public function getImage($content)
    {
        $client = new Client();
        $url = "https://api.pexels.com/v1/search?orientation=landscape&query=$content&per_page=1";
        $data = [
            'headers' => [
                'Authorization' => 'KXazx6Fg1nf5Nq66F0Y0Qe6BFJ6o0oE0U6qoipIdsXcwqBpBsORGUgIr'
            ]
        ];

        try {
            $response = $client->get($url, $data);
            $body = json_decode($response->getBody()->getContents(), true);
            return response()->json(['data' =>  $body["photos"][0]["src"]["original"]]);
        } catch (RequestException $e) {
            $errorMessage = $e->getMessage();
            if ($e->hasResponse()) {
                $errorMessage = $e->getResponse()->getBody()->getContents();
            }
            return response()->json(['error' => 'Erreur lors de la requête', 'message' => $errorMessage], 500);
        }
    }

    public function getQuiz($category)
    {
        $client = new Client();
        $url = "https://quizzapi.jomoreschi.fr/api/v1/quiz?limit=5&category=$category&difficulty=normal";
        $data = [
            'headers' => [
                'accept' => 'application/json'
            ]
        ];
        try {
            $response = $client->get($url,  $data);
            $body = json_decode($response->getBody()->getContents(), true);
            return response()->json(['data' =>  $body["quizzes"]]);
        } catch (RequestException $e) {
            $errorMessage = $e->getMessage();
            if ($e->hasResponse()) {
                $errorMessage = $e->getResponse()->getBody()->getContents();
            }
            return response()->json(['error' => 'Erreur lors de la requête', 'message' => $errorMessage], 500);
        }
    }
}
