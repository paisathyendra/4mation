<?php

namespace App\Http\Controllers;

use App\Http\Services\CNAPI;
use App\Vote;
use Illuminate\Support\Facades\DB;

class VoteController extends Controller
{

    /**
     * Like
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function voteUp($id)
    {
        $vote = Vote::firstOrNew(array('user_id' => \Auth::user()->id, 'joke_id' => $id));
        $vote->vote= 1;
        $vote->save();
        return redirect()->back();
    }

    /**
     * Dislike
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function voteDown($id)
    {
        $vote = Vote::firstOrNew(array('user_id' => \Auth::user()->id, 'joke_id' => $id));
        $vote->vote= 0;
        $vote->save();
        return redirect()->back();
    }

    /**
     * Get Jokes By Rank
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function rank()
    {
        $jokes = DB::table('votes')
            ->select(DB::raw('count(*) as vote_count, joke_id'))
            ->where('vote', '=', 1)
            ->groupBy('joke_id')
            ->orderBy('vote_count', 'desc')
            ->limit(10)
            ->get();

        $jokesArray = json_decode($jokes);
        $jokes = array();
        foreach($jokesArray as $joke) {
            $jokes[] = ['joke_value' => CNAPI::getJokeById($joke->joke_id), 'vote' => $joke->vote_count];
        }
        return view('leaderboard', ['jokes' => $jokes]);
    }

    /**
     * Get Vote Details By Joke Id
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public static function voteDetails($id)
    {
        $likes = json_decode(DB::table('votes')
            ->select(DB::raw('count(*) as vote_count'))
            ->where('joke_id', '=', $id)
            ->where('vote','=', 1)
            ->groupBy('joke_id')
            ->get());

        $dislikes = json_decode(DB::table('votes')
            ->select(DB::raw('count(*) as vote_count'))
            ->where('joke_id', '=', $id)
            ->where('vote','=', 0)
            ->groupBy('joke_id')
            ->get());

        $likesCount = empty($likes)? 0 : $likes;
        $dislikesCount = empty($dislikes) ? 0 : $dislikes;

        return array($likesCount,$dislikesCount);
    }

}
