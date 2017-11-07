<?php

namespace App\Http\Controllers;

use App\Http\Services\CNAPI;
use App\Vote;
use Illuminate\Support\Facades\DB;

class VoteController extends Controller
{
    const LIKE = 1;
    const DISLIKE = 0;

    /**
     * Like Joke
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function voteUp($id)
    {
        $data = array('user_id' => \Auth::user()->id, 'joke_id' => $id);

        $vote = Vote::firstOrNew($data);
        $vote->vote = self::LIKE;
        $vote->save();

        return redirect()->back();
    }

    /**
     * Dislike Joke
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function voteDown($id)
    {
        $data = array('user_id' => \Auth::user()->id, 'joke_id' => $id);

        $vote = Vote::firstOrNew($data);
        $vote->vote = self::DISLIKE;
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
            ->where('vote', '=', self::LIKE)
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
            ->where('vote','=', self::LIKE)
            ->groupBy('joke_id')
            ->get());

        $dislikes = json_decode(DB::table('votes')
            ->select(DB::raw('count(*) as vote_count'))
            ->where('joke_id', '=', $id)
            ->where('vote','=', self::DISLIKE)
            ->groupBy('joke_id')
            ->get());

        $likesCount = empty($likes)? self::DISLIKE : $likes;
        $dislikesCount = empty($dislikes) ? self::DISLIKE : $dislikes;

        return array($likesCount,$dislikesCount);
    }

}
