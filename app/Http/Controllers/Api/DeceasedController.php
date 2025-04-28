<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DeceasedController extends Controller
{
    public function getByPlotId($plotId)
    {
        try {
            $deceased = DB::table('deceased')
                ->select(
                    'FirstName',
                    'MiddleName',
                    'LastName',
                    'DateOfBirth',
                    'DateOfDeath'
                )
                ->where('Plot_ID', $plotId)
                ->get();

            return response()->json($deceased);
            
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
