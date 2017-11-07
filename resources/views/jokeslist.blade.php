@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">Search Results</div>
                    <div class="panel-body">
                        @if($jokes->total == 0)
                            <b>No Result Found</b>
                        @else
                            <table>
                                @foreach($jokes->result as $joke)
                                    <tr>
                                        <td>{{ $joke->value }}</td>
                                        <td><a href="../jokes/up/{{$joke->id}}">Up</a></td>
                                        <td><a href="../jokes/down/{{$joke->id}}">Down</a></td>
                                    </tr>
                                @endforeach
                            </table>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
