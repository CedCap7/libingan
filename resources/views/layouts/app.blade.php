<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ config('app.name', 'Don Carlos Cemetery Management System') }}</title>

    @yield('styles')
</head>
<body>
    @yield('content')
    @yield('scripts')
