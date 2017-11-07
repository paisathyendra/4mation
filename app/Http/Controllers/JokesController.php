<?php

namespace App\Http\Controllers;

use App\Http\Services\CNAPI;
use Illuminate\Http\Request;

class JokesController extends Controller
{
    public function index() {
        $categories = json_decode(CNAPI::getCategories());
        return view('categories', ['categories' => $categories]);
    }

    public function show($category){
        $jokes = json_decode(CNAPI::getRandomJokeByCategory($category));
        list($likes, $dislikes) = VoteController::voteDetails($jokes->id);
        return view('jokes', ['jokes' => $jokes, 'likes' => $likes, 'dislikes' => $dislikes]);
    }

    public function search() {
        return view('welcome');
    }

    public function searchresult(Request $request) {
        $search = $request->input('search');
        $jokes = json_decode(CNAPI::getJokeByText($search));
        return view('jokeslist', compact('jokes'));
    }

    public function rank() {
        return view('leaderboard');
    }
}
