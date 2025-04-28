<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Deceased;
use Illuminate\Support\Facades\DB;

class MapController extends Controller
{
    public function map()
    {
        // Group deceased data by Plot_ID and Level
        $deceasedData = Deceased::select('Plot_ID', 'Level', 'FirstName', 'MiddleName', 'LastName', 'DateOfBirth', 'DateOfDeath')
            ->get()
            ->groupBy(['Plot_ID', 'Level']) // This creates a nested grouping
            ->toArray();

        return view('map', compact('deceasedData'));
    }

    public function index()
    {
        return view('index');
    }

    public function getDeceasedByPlotId($plotId)
    {
        $deceased = DB::table('deceased')
            ->join('location', 'deceased.Plot_ID', '=', 'location.id')
            ->where('location.id', $plotId)
            ->select('deceased.*')
            ->get();

        return response()->json($deceased);
    }
    public function getPlotStatus($plotId)
{
    $plot = Plot::find($plotId);
    $deceasedCount = Deceased::where('Plot_ID', $plotId)->count();
    
    return response()->json([
        'occupiedLevels' => $deceasedCount,
        'maxLevels' => $plot->max_levels ?? null
    ]);
}
}