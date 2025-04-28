<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Location;

class PlotSelectionController extends Controller
{
    public function store(Request $request)
    {
        $plotData = $request->all();
        
        // Store or update the selection in a temporary table
        // Your VB.NET application can poll this data
        
        return response()->json([
            'message' => 'Plot selection received',
            'data' => $plotData
        ]);
    }
}