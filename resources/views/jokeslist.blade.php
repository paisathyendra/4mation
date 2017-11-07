@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">Search Results</div>

                    <div class="panel-body">
                        <table>
                        @foreach($jokes->result as $joke)
                        <tr>
                            <td>{{ $joke->value }}</td>
                            <td><a href="../jokes/up/{{$joke->id}}">Up</a></td>
                            <td><a href="../jokes/down/{{$joke->id}}">Down</a></td>
                        </tr>
                        @endforeach
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
