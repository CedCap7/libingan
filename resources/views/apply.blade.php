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
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card card-custom border-0">
                <div class="card-header bg-transparent border-0 text-center">
                    <h2 class="mb-0 fw-bold text-dark">Online Application</h2>
                    <p class="text-muted">Apply for reservation in minutes</p>
                </div>
                <div class="card-body">
                    @if(session('success'))
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            {{ session('success') }}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    @endif
                    
                    <form action="{{ route('application.store') }}" method="POST" class="needs-validation" novalidate>
                        @csrf
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="firstName" class="form-label">First Name</label>
                                <input type="text" class="form-control @error('firstName') is-invalid @enderror" 
                                    id="firstName" name="firstName" placeholder="Juan" required value="{{ old('firstName') }}">
                                @error('firstName')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            
                            <div class="col-md-6 mb-3">
                                <label for="middleName" class="form-label">Middle Name <span class="text-muted">(optional)</span></label>
                                <input type="text" class="form-control" id="middleName" name="middleName" value="{{ old('middleName') }}">
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="lastName" class="form-label">Last Name</label>
                            <input type="text" class="form-control @error('lastName') is-invalid @enderror" 
                                id="lastName" name="lastName" placeholder="Dela Cruz" required value="{{ old('lastName') }}">
                            @error('lastName')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                        
                        <div class="mb-3">
                            <label for="email" class="form-label">Email Address</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                <input type="email" class="form-control @error('email') is-invalid @enderror" 
                                    id="email" name="email" placeholder="example@example.com" required value="{{ old('email') }}">
                                @error('email')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="form-text">
                                Your email will be used to send notifications about the status of your grave space or to inform if it has expired, needs renewal, or relocation.
                            </div>
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label d-block">Gender</label>
                            <div class="d-flex gap-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="gender" id="male" value="Male" required {{ old('gender') == 'Male' ? 'checked' : '' }}>
                                    <label class="form-check-label" for="male">Male</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="gender" id="female" value="Female" required {{ old('gender') == 'Female' ? 'checked' : '' }}>
                                    <label class="form-check-label" for="female">Female</label>
                                </div>
                            </div>
                            @error('gender')
                                <div class="text-danger small mt-1">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="mobile" class="form-label">Phone Number</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-phone"></i></span>
                                <input type="text" class="form-control @error('mobile') is-invalid @enderror" 
                                    id="mobile" name="mobile" placeholder="(+63) 000-000-0000" required value="{{ old('mobile') }}">
                                @error('mobile')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                        <div class="mb-4">
                            <label for="address" class="form-label">Address</label>
                            <textarea class="form-control @error('address') is-invalid @enderror" 
                                id="address" name="address" rows="2" placeholder="Enter your complete address" required>{{ old('address') }}</textarea>
                            @error('address')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                        
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-dark btn-lg">Submit Application</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

