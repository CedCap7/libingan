<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class SearchController extends Controller
{
    public function search(Request $request)
    {
        try {
            $searchTerm = $request->input('term');
            Log::info('Search term:', ['term' => $searchTerm]);

            $results = DB::table('deceased')
                ->join('location', 'deceased.Plot_ID', '=', 'location.id')
                ->select([
                    'deceased.Plot_ID',
                    'deceased.Deceased_ID',
                    'deceased.FirstName',
                    'deceased.MiddleName',
                    'deceased.LastName',
                    'location.id as location_id',
                    'location.type as plot_type',
                    'location.block',
                    'location.section',
                    'location.row',
                    'location.plot'
                ])
                ->where(function($query) use ($searchTerm) {
                    $query->where('FirstName', 'LIKE', "%{$searchTerm}%")
                          ->orWhere('MiddleName', 'LIKE', "%{$searchTerm}%")
                          ->orWhere('LastName', 'LIKE', "%{$searchTerm}%");
                })
                ->limit(10)
                ->get();

            return response()->json($results);

        } catch (\Exception $e) {
            Log::error('Search error:', [
                'message' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);
            
            return response()->json([
                'error' => 'An error occurred while searching',
                'details' => $e->getMessage()
            ], 500);
        }
    }
} 