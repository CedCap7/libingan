<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class AddressController extends Controller
{
    public function getRegions()
    {
        $regions = json_decode(file_get_contents(public_path('data/ph-address/regions.json')), true);
        return response()->json($regions);
    }

    public function getProvinces($regionId)
    {
        $provinces = json_decode(file_get_contents(public_path('data/ph-address/provinces.json')), true);
        $filteredProvinces = array_filter($provinces['provinces'], function($province) use ($regionId) {
            return $province['region_id'] === $regionId;
        });
        return response()->json(['provinces' => array_values($filteredProvinces)]);
    }

    public function getCities($provinceId)
    {
        $cities = json_decode(file_get_contents(public_path('data/ph-address/cities.json')), true);
        $filteredCities = array_filter($cities['cities'], function($city) use ($provinceId) {
            return $city['province_id'] === $provinceId;
        });
        return response()->json(['cities' => array_values($filteredCities)]);
    }

    public function getBarangays($cityId)
    {
        try {
            $barangays = json_decode(file_get_contents(public_path('data/ph-address/barangays.json')), true);
            
            if (json_last_error() !== JSON_ERROR_NONE) {
                Log::error('Error decoding barangays JSON: ' . json_last_error_msg());
                return response()->json(['error' => 'Invalid JSON data'], 500);
            }

            if (!isset($barangays['barangays']) || !is_array($barangays['barangays'])) {
                Log::error('Invalid barangays data structure');
                return response()->json(['error' => 'Invalid data structure'], 500);
            }

            $filteredBarangays = array_filter($barangays['barangays'], function($barangay) use ($cityId) {
                return $barangay['city_id'] === $cityId;
            });

            Log::info('Filtered barangays for city ' . $cityId . ': ' . count($filteredBarangays));

            return response()->json(['barangays' => array_values($filteredBarangays)]);
        } catch (\Exception $e) {
            Log::error('Error loading barangays: ' . $e->getMessage());
            return response()->json(['error' => 'Error loading barangays'], 500);
        }
    }
} 