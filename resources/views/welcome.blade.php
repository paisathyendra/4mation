@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">Search Joke</div>

                    <div class="panel-body">
                        {!! Form::open(['route' => 'search_joke', 'method' => 'post']) !!}

                        <div class="form-group">
                            {!! Form::label('lblsearch', 'Search Keyword') !!}
                            {!! Form::text('search', '', ['class' => 'form-control']) !!}
                        </div>

                        <button class="btn btn-success" type="submit">Search</button>

                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection