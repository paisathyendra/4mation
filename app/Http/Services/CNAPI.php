<?php

namespace App\Http\Services;

use GuzzleHttp\Client;
use GuzzleHttp\Psr7\Request;

class CNAPI
{
    public static function getCategories() {
        $client = new \GuzzleHttp\Client();
        $res = $client->request('GET', 'https://api.chucknorris.io/jokes/categories');
        return $res->getBody();
    }

    public static function getRandomJoke() {
        $client = new \GuzzleHttp\Client();
        $res = $client->request('GET', 'https://api.chucknorris.io/jokes/random');
        return $res->getBody();
    }

    public static function getRandomJokeByCategory($category) {
        $client = new \GuzzleHttp\Client();
        $res = $client->request('GET', 'https://api.chucknorris.io/jokes/random?category='.$category);
        return $res->getBody();
    }

    public static function getJokeByText($search) {
        $client = new \GuzzleHttp\Client();
        $res = $client->request('GET', 'https://api.chucknorris.io/jokes/search?query='.$search);
        return $res->getBody();
    }

    public static function getJokeById($id) {
        $contents = file_get_contents('http://api.chucknorris.io/jokes/'.$id);
        $pattern = "/<p ?.*>(.*)<\/p>/";
        preg_match($pattern, $contents, $matches);
        return $matches[1];
    }

}