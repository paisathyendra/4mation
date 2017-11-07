<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'JokesController@index')->middleware('auth');
// Category
Route::get('jokes/category/{category}', 'JokesController@show')->middleware('auth');
// Search Screen
Route::get('jokes/search', ['as' => 'search', 'uses' => 'JokesController@search'])->middleware('auth');
// Search Joke
Route::post('jokes/search', ['as' => 'search_joke', 'uses' => 'JokesController@searchResult'])->middleware('auth');
// Leaderboard Screen
Route::get('jokes/leaderboard', 'VoteController@rank')->middleware('auth');
// Like
Route::get('jokes/up/{id}', 'VoteController@voteUp')->middleware('auth');
// Dislike
Route::get('jokes/down/{id}', 'VoteController@voteDown')->middleware('auth');
// Home
Route::get('/home', 'JokesController@index')->middleware('auth');

Auth::routes();
