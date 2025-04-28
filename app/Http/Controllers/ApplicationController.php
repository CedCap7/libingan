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
        // Validate incoming data; adjust rules as needed.
        $validated = $request->validate([
            'firstName'  => 'required|string|max:255',
            'middleName' => 'nullable|string|max:255',
            'lastName'   => 'required|string|max:255',
            'email'      => 'required|email|max:255',
            'mobile'     => 'required|string|max:50',  // changed from 'contact' to 'mobile'
            'address'    => 'required|string|max:500',
            'gender'     => 'required|string|in:Male,Female',
        ]);

        // Debugging tip (optional): Uncomment below to inspect validated data
        // dd($validated);

        // Insert the application data into the 'application' table.
        // Ensure that the table and column names match your database schema.
        DB::table('application')->insert([
            'firstName'    => $validated['firstName'],
            'middleName'   => $validated['middleName'] ?? null,
            'lastName'     => $validated['lastName'],
            'email'        => $validated['email'],
            'mobile'       => $validated['mobile'],   // use the validated mobile value
            'address'      => $validated['address'],
            'gender'       => $validated['gender'],
            'Date_Applied' => now(),
            'status'       => 0,
        ]);

        // Redirect to the welcome page with a success message.
        return redirect()->route('welcome')
                         ->with('success', 'Your application has been submitted successfully!');
    }
}
