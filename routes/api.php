<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PlotController;
use App\Http\Controllers\SearchController;
use Illuminate\Support\Facades\DB;

// Remove any middleware grouping temporarily for testing
Route::get('plot-records/{id}', [PlotController::class, 'getRecords']);
Route::get('/search', [SearchController::class, 'search']);

Route::get('/plot-availability', function () {
    try {
        // Get all plot IDs that exist in the deceased table
        $ownedPlotIds = DB::table('deceased')
            ->select('Plot_ID')
            ->distinct()
            ->pluck('Plot_ID')
            ->toArray();

        // Create an array where the keys are plot IDs and values are true if owned
        $availability = [];
        foreach ($ownedPlotIds as $plotId) {
            $availability[$plotId] = true;
        }

        return response()->json($availability);
    } catch (\Exception $e) {
        return response()->json(['error' => $e->getMessage()], 500);
    }
});
