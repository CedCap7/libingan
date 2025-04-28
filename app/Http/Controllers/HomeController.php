<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    // Return the welcome page
    public function index()
    {
        return view('welcome');
    }
}
