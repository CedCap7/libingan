<!-- resources/views/welcome.blade.php -->
@extends('layouts.header')

@section('content')
<div class="container text-center">
    <h1>Welcome to Our Online Application Portal</h1>
    <p>Apply for an account easily online!</p>
    <!-- Button that redirects to the application page -->
    <a href="{{ route('apply') }}" class="btn btn-primary">Apply Now</a>
</div>
@endsection
