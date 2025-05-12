<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MapController;
use App\Http\Controllers\LocationController;
use App\Http\Controllers\Api\DeceasedController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ApplicationController;
use App\Http\Controllers\AddressController;

Route::get('/apply', [ApplicationController::class, 'create'])->name('apply');
Route::post('/apply', [ApplicationController::class, 'store'])->name('application.store');

// Address routes
Route::get('/address/regions', [AddressController::class, 'getRegions']);
Route::get('/address/provinces/{regionId}', [AddressController::class, 'getProvinces']);
Route::get('/address/cities/{provinceId}', [AddressController::class, 'getCities']);
Route::get('/address/barangays/{cityId}', [AddressController::class, 'getBarangays']);

Route::get('/aboutus', [HomeController::class, 'about'])->name('about');
Route::get('/welcome', [HomeController::class, 'index'])->name('welcome');
Route::get('/', [LocationController::class, 'index'])->name('index');
// Route::get('/', [MapController::class, 'index'])->name('index');
Route::get('/map', [MapController::class, 'map'])->name('map');
Route::get('/test-deceased/{plotId}', [DeceasedController::class, 'getByPlotId']);
Route::get('/deceased/{plotId}', [MapController::class, 'getDeceasedByPlotId']);
Route::get('/search', [SearchController::class, 'search'])->name('search');
Route::get('/availability', [LocationController::class, 'availability'])->name('availability');

Route::get('/check-email/{email}', [ApplicationController::class, 'checkEmail']);

// Route::post('/plot-selection', [App\Http\Controllers\Api\PlotSelectionController::class, 'store']);