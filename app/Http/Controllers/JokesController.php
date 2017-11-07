<?php

namespace App\Http\Controllers;

use App\Http\Services\CNAPI;
use Illuminate\Http\Request;

class JokesController extends Controller
{
    /**
     * Get Categories
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index() {
        $categories = json_decode(CNAPI::getCategories());
        return view('categories', ['categories' => $categories]);
    }

    /**
     * Get Joke By Category
     * @param $category
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function show($category){
        // Fetch Random Joke By Category
        $jokes = json_decode(CNAPI::getRandomJokeByCategory($category));
        // Fetch likes & dislikes count for joke
        list($likes, $dislikes) = VoteController::voteDetails($jokes->id);
        // Render on Joes View
        return view('jokes', ['jokes' => $jokes, 'likes' => $likes, 'dislikes' => $dislikes]);
    }

    /**
     * Display Search Result
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function searchResult(Request $request) {
        // Search String
        $search = $request->input('search');

        if(!empty($search)) {
            // Fetch Joke by Search String
            $jokes = json_decode(CNAPI::getJokeByText($search));
            // Render on Jokelist View
            return view('jokeslist', compact('jokes'));
        } else {
            return redirect()->back()->withErrors('Errors');
        }
    }

    /**
     * Search View
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function search() {
        return view('welcome');
    }

    /**
     * Leaderboard View
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function rank() {
        return view('leaderboard');
    }
}
