@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">Leaderboard</div>

                    <div class="panel-body">
                        <table>
                            <tr>
                                <th>Rank</th>
                                <th>Joke</th>
                                <th>Likes</th>
                            </tr>
                            @foreach($jokes as $key=>$joke)
                                <tr>
                                    <td>{{$key+1}}</td>
                                    <td>{{$joke['joke_value']}}</td>
                                    <td>{{$joke['vote']}}</td>
                                </tr>
                            @endforeach
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
