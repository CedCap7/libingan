<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PlotController extends Controller
{
    public function getRecords($id)
    {
        \Log::info('Accessing plot records with ID: ' . $id);
        
        try {
            $records = DB::table('deceased')
                ->join('locations', 'deceased.Plot_ID', '=', 'locations.id')
                ->where('locations.id', $id)
                ->select('deceased.*')
                ->get();

            \Log::info('Query executed successfully. Found ' . $records->count() . ' records');
            
            return response()->json($records);
        } catch (\Exception $e) {
            \Log::error('Error in getRecords: ' . $e->getMessage());
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
} 