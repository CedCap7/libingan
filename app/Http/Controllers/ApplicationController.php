<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ApplicationController extends Controller
{
    // Show the online application form
    public function create()
    {
        return view('apply'); // This loads resources/views/apply.blade.php
    }

    // Process the online application form submission
    public function store(Request $request)
    {
        try {
            // Validate incoming data
        $validated = $request->validate([
            'firstName'  => 'required|string|max:255',
            'middleName' => 'nullable|string|max:255',
            'lastName'   => 'required|string|max:255',
            'email'      => 'required|email|max:255',
            'mobile'     => 'required|string|max:50',
                'country'    => 'required|string|max:2',
            'region'     => 'required|string|max:10',
            'province'   => 'required|string|max:10',
            'city'       => 'required|string|max:10',
            'barangay'   => 'required|string|max:10',
            'street'     => 'required|string|max:255',
            'gender'     => 'required|string|in:Male,Female',
                'service_to_avail' => 'required|string|in:Apartment,Family Lawn Lot,Private,Bone Niche',
        ]);

        // Format the complete address
        $completeAddress = $validated['street'] . ', ' . 
                         $this->getBarangayName($validated['barangay']) . ', ' . 
                         $this->getCityName($validated['city']) . ', ' . 
                         $this->getProvinceName($validated['province']) . ', ' . 
                             $this->getRegionName($validated['region']) . ', ' .
                             'Philippines';

        // Insert the application data into the 'application' table
        DB::table('application')->insert([
            'FirstName'    => $validated['firstName'],
            'MiddleName'   => $validated['middleName'] ?? null,
            'LastName'     => $validated['lastName'],
            'Email'        => $validated['email'],
            'Mobile'       => $validated['mobile'],
            'Address'      => $completeAddress,
            'Gender'       => $validated['gender'],
            'Date_Applied' => now(),
            'Status'       => '0',
                'service_to_avail' => $validated['service_to_avail'],
        ]);

            // Check if the request is AJAX
            if ($request->ajax()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Application submitted successfully!',
                    'redirect' => route('welcome')
                ]);
            }

            // For non-AJAX requests, redirect with success message
        return redirect()->route('welcome')
                         ->with('success', 'Your application has been submitted successfully!');
        } catch (\Illuminate\Validation\ValidationException $e) {
            if ($request->ajax()) {
                return response()->json([
                    'success' => false,
                    'errors' => $e->errors()
                ], 422);
            }
            throw $e;
        } catch (\Exception $e) {
            if ($request->ajax()) {
                return response()->json([
                    'success' => false,
                    'message' => 'An error occurred while submitting your application.'
                ], 500);
            }
            throw $e;
        }
    }

    // Helper methods to get location names from IDs
    private function getRegionName($regionId)
    {
        $regions = json_decode(file_get_contents(public_path('data/ph-address/regions.json')), true);
        foreach ($regions['regions'] as $region) {
            if ($region['id'] === $regionId) {
                return $region['name'];
            }
        }
        return '';
    }

    private function getProvinceName($provinceId)
    {
        $provinces = json_decode(file_get_contents(public_path('data/ph-address/provinces.json')), true);
        foreach ($provinces['provinces'] as $province) {
            if ($province['id'] === $provinceId) {
                return $province['name'];
            }
        }
        return '';
    }

    private function getCityName($cityId)
    {
        $cities = json_decode(file_get_contents(public_path('data/ph-address/cities.json')), true);
        foreach ($cities['cities'] as $city) {
            if ($city['id'] === $cityId) {
                return $city['name'];
            }
        }
        return '';
    }

    private function getBarangayName($barangayId)
    {
        $barangays = json_decode(file_get_contents(public_path('data/ph-address/barangays.json')), true);
        foreach ($barangays['barangays'] as $barangay) {
            if ($barangay['id'] === $barangayId) {
                return $barangay['name'];
            }
        }
        return '';
    }

    public function checkEmail($email)
    {
        try {
            // Check in both client and application tables
            $existsInClient = DB::table('client')->where('Email', $email)->exists();
            $existsInApplication = DB::table('application')->where('Email', $email)->exists();
            
            // Return true if email exists in either table
            return response()->json([
                'exists' => $existsInClient || $existsInApplication,
                'message' => $existsInClient || $existsInApplication ? 
                    'This email is already registered in our system' : 
                    'Email is available'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Error checking email',
                'message' => 'Unable to verify email availability. Please try again.'
            ], 500);
        }
    }
}
