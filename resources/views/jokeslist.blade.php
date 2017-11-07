@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">Search Results</div>
                    <div class="panel-body">
                        @if(isset($jokes['total']) && $jokes['total'] == 0)
                            <b>No Results Found</b>
                        @else
                            @foreach($jokes as $key => $joke)
                                <div class="row">
                                    <div class="col-md-1">
                                        {{ $key+1 }}
                                    </div>
                                    <div class="col-md-9">
                                        {{ $joke['value'] }}
                                    </div>
                                    <div class="col-md-1">
                                        <a href="../jokes/up/{{$joke['id']}}">Like</a> ({{ $joke['likes_count']  }})
                                    </div>
                                    <div class="col-md-1">
                                        <a href="../jokes/down/{{$joke['id']}}">Dislike</a> ({{ $joke['dislikes_count']  }})
                                    </div>
                                </div>
                            @endforeach
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
