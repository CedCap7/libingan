<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PlotController;
use App\Http\Controllers\SearchController;

// Remove any middleware grouping temporarily for testing
Route::get('plot-records/{id}', [PlotController::class, 'getRecords']);
Route::get('/search', [SearchController::class, 'search']);
