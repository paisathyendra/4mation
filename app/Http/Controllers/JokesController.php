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
            $jokesObject = json_decode(CNAPI::getJokeByText($search));

            if($jokesObject->total != 0) {
                foreach ($jokesObject->result as $joke) {
                    // Get like and dislike count
                    list($likes, $dislikes) = VoteController::voteDetails($joke->id);
                    // Likes count
                    $likesCount = is_array($likes) ? $likes[0]->vote_count : $likes;
                    // Dislikes count
                    $dislikesCount = is_array($dislikes) ? $dislikes[0]->vote_count : $dislikes;
                    $jokes[] = ['id' => $joke->id, 'value' => $joke->value, 'likes_count' => $likesCount, 'dislikes_count' => $dislikesCount];
                }
            } else {
                $jokes['total'] = 0;
            }
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
