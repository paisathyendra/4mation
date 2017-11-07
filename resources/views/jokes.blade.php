@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">Joke of the day</div>

                    <div class="panel-body">
                        <p>
                            {{ $jokes->value }}
                        </p>
                        <p>
                            <a href="../up/{{$jokes->id}}">Like</a> ({{ $likes }})
                            <a href="../down/{{$jokes->id}}">Dislike</a> ({{ $dislikes }})
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

