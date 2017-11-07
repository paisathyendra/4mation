@extends('layouts.app')

@section('content')
        <div class="container">
                <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                                <div class="panel panel-default">
                                        <div class="panel-heading">Welcome</div>

                                        <div class="panel-body">
                                                <b><a href="jokes/search">Search</a></b>
                                                <b><a href="jokes/leaderboard">Leaderboard</a></b>
                                                <div>
                                                        <b>Joke Categories</b>
                                                        <ul>
                                                                @foreach($categories as $category)
                                                                        <li><a href="/jokes/category/{{$category}}">{{$category}}</a></li>
                                                                @endforeach
                                                        </ul>
                                                </div>
                                        </div>
                                </div>
                        </div>
                </div>
        </div>
@endsection