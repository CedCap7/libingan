<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MapController;
use App\Http\Controllers\LocationController;
use App\Http\Controllers\Api\DeceasedController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ApplicationController;

Route::get('/apply', [ApplicationController::class, 'create'])->name('apply');
Route::post('/apply', [ApplicationController::class, 'store'])->name('application.store');
Route::get('/welcome', [HomeController::class, 'index'])->name('welcome');
Route::get('/', [LocationController::class, 'index'])->name('index');
// Route::get('/', [MapController::class, 'index'])->name('index');
Route::get('/map', [MapController::class, 'map'])->name('map');
Route::get('/test-deceased/{plotId}', [DeceasedController::class, 'getByPlotId']);
Route::get('/deceased/{plotId}', [MapController::class, 'getDeceasedByPlotId']);
Route::get('/search', [SearchController::class, 'search'])->name('search');
Route::get('/availability', [LocationController::class, 'availability'])->name('availability');

// Route::post('/plot-selection', [App\Http\Controllers\Api\PlotSelectionController::class, 'store']);