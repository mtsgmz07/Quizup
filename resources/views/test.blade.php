<?php

use GuzzleHttp\Client;

$client = new Client();
$response = $client->post('https://api.example.com/endpoint', [
    'form_params' => [
        'key1' => 'value1',
        'key2' => 'value2'
    ],
]);

echo $response->getBody();