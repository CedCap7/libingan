@extends('layouts.header')

@section('styles')
    <!-- Link to Bootstrap CSS -->
    <link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}">
    
    <!-- Existing styles for MapLibre and your custom CSS -->
    <link href="https://unpkg.com/maplibre-gl@3.6.2/dist/maplibre-gl.css" rel="stylesheet" />
    <link href="{{ asset('css/map.css') }}" rel="stylesheet" />
    
    <style>
        /* Custom styling for the card */
        .card-custom {
            max-width: 600px;
            margin: 50px auto;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 20px;
        }
    </style>
@endsection

@section('content')
<div class="container">
    <div class="card card-custom">
        <div class="card-header text-center">
            <h2>Online Application for Clients</h2>
        </div>
        <div class="card-body">
            <p class="text-center">Please fill in your details to create an account.</p>
            <form action="{{ route('application.store') }}" method="POST">
                @csrf
                <div class="mb-3">
                    <label for="firstName" class="form-label">First Name</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Juan" required>
                </div>
                <div class="mb-3">
                    <label for="middleName" class="form-label">Middle Name</label>
                    <input type="text" class="form-control" id="middleName" name="middleName">
                </div>
                <div class="mb-3">
                    <label for="lastName" class="form-label">Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Dela Cruz" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="example@example.com" required>
                </div>
                <!-- New Gender Radio Buttons -->
                <div class="mb-3">
                    <label class="form-label">Gender</label> <br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="Male" required>
                        <label class="form-check-label" for="male">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="Female" required>
                        <label class="form-check-label" for="female">Female</label>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="mobile" class="form-label">Phone Number</label>
                    <input type="text" class="form-control" id="mobile" name="mobile" placeholder="(+63) 000-000-0000" required>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" class="form-control" id="address" name="address" placeholder="123 Main Street" required>
                </div>
                <!-- Add additional fields as needed -->
                <div class="d-grid">
                    <button type="submit" class="btn btn-success">Submit Application</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

