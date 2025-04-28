<?php

namespace App\Http\Controllers;

use App\Models\Location;
use App\Models\Deceased;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LocationController extends Controller
{
    public function index()
    {
        $location = DB::table('location')
            ->select(
                'location.id as plot_id',
                'location.type',
                'location.block',
                'location.section',
                'location.row',
                'location.plot'
            )
            ->get()
            ->keyBy('plot_id');

        // Get deceased data grouped by plot and level
        $deceasedData = Deceased::select(
                'Plot_ID',
                'Level',
                'FirstName',
                'MiddleName',
                'LastName',
                'DateOfBirth',
                'DateOfDeath'
            )
            ->get()
            ->groupBy('Plot_ID');

        // Get available levels for each plot
        $plotLevels = Deceased::select('Plot_ID', 'Level')
            ->get()
            ->groupBy('Plot_ID')
            ->map(function ($group) {
                return $group->pluck('Level')->unique()->sort()->values();
            });

        return view('index', compact('location', 'deceasedData', 'plotLevels'));
    }

    public function availability()
    {
        // Define plot limits (example values)
        $plotLimits = [
            '1' => 1, // Apartment
            '2' => 4, // Family Lawn Lots
            '3' => 2, // Bone Niche
            '4' => 1  // Private
        ];

        // Fetch plots with their current usage by joining with the deceased table
        $plots = Location::leftJoin('deceased', 'location.id', '=', 'deceased.Plot_ID')
            ->select('location.id', DB::raw('COUNT(deceased.Deceased_ID) as current_usage'))
            ->groupBy('location.id')
            ->get();

        // Add capacity and availability status to each plot
        foreach ($plots as $plot) {
            $plotType = $plot->plot_type; // Assuming plot_type is available
            $plot->capacity = $plotLimits[$plotType] ?? 0;
            $plot->isFull = $plot->current_usage >= $plot->capacity;
        }

        // Pass the data to the view
        return view('availability', compact('plots'));
    }
}