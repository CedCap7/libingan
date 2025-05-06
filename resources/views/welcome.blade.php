<!-- resources/views/welcome.blade.php -->
@extends('layouts.header')

@section('content')
<style>
    /* Base Styles */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
    }
    
    /* Hero Section */
    .hero-section {
        margin-bottom: 2rem;
        position: relative;
    }
    .text-shadow {
        text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
    }
    
    /* Content Sections */
    .main-content {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        padding: 2rem;
        margin-bottom: 2rem;
    }
    
    /* Card Styles */
    .card {
        border: none;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        transition: transform 0.3s;
        height: 100%;
    }
    .card:hover {
        transform: translateY(-5px);
    }
    .card-img-top {
        border-top-left-radius: 8px;
        border-top-right-radius: 8px;
        height: 180px;
        object-fit: cover;
    }
    .card-body {
        padding: 1.5rem;
    }
    .card-title {
        font-weight: 600;
        margin-bottom: 0.5rem;
    }
    
    /* Button Styles */
    .btn-primary {
        background-color: #4361ee;
        border: none;
        padding: 0.75rem 2rem;
        font-weight: 600;
        transition: all 0.3s;
    }
    .btn-primary:hover {
        background-color: #3a56d4;
        transform: translateY(-2px);
    }
    
    /* Footer */
    .footer {
        background-color: #fff;
        padding: 1.5rem 0;
        box-shadow: 0 -2px 10px rgba(0,0,0,0.1);
    }
    
    /* Animation Styles */
    .fade-in {
        opacity: 0;
        transform: translateY(20px);
        transition: opacity 0.6s ease-out, transform 0.6s ease-out;
    }
    
    .fade-in.visible {
        opacity: 1;
        transform: translateY(0);
    }
    
    .delay-100 { transition-delay: 0.1s; }
    .delay-200 { transition-delay: 0.2s; }
    .delay-300 { transition-delay: 0.3s; }
    .delay-400 { transition-delay: 0.4s; }
    
    .hero-text {
        opacity: 0;
        transform: translateY(30px);
        transition: opacity 0.8s ease-out, transform 0.8s ease-out;
    }
    
    .hero-text.visible {
        opacity: 1;
        transform: translateY(0);
    }
</style>

<!-- Main Content -->
<div class="container-fluid px-0">
    <!-- Hero Section -->
    <div class="hero-section" style="background-color: #000; height: 93vh;">
        <img src="/images/welcome/welcome.jpg" alt="DCCMS Welcome" class="img-fluid w-100" style="object-fit: cover; height: 90vh;">
        <div class="position-absolute top-50 start-50 translate-middle text-center text-white">
            <h1 class="display-3 fw-bold text-shadow hero-text">DCCMS</h1>
            <p class="lead fs-4 text-shadow hero-text delay-200">Your trusted partner in memorial services</p>
            <a href="{{ route('apply') }}" class="btn btn-primary btn-lg mt-3 hero-text delay-400">Apply Now</a>
        </div>
    </div>

    <!-- About Section -->
    <div class="container py-5">
        <div class="row align-items-center">
            <div class="col-lg-6 mb-4 mb-lg-0">
                <h2 class="mb-4 fade-in">Welcome to DCCMS</h2>
                <h4 class="fade-in delay-100"></h4>
                <p class="lead fade-in delay-200">Our simple application process is designed to get you started quickly and efficiently.</p>
                <p class="fade-in delay-300">We are committed to providing compassionate and professional memorial services to honor your loved ones with dignity and respect.</p>
                <a href="{{route('about')}}" class="btn btn-outline-primary mt-3 fade-in delay-400">Learn More About Us</a>
            </div> 
            <div class="col-lg-6 fade-in">
                <img src="/images/welcome/aboutusnew.jpg" class="img-fluid shadow fade-in" alt="About DCCMS" style="border-radius: 20px; overflow: hidden;">
            </div>
        </div>
    </div>

    <!-- Services Section -->
    <div class="container mb-5">
        <h2 class="text-center mb-4 fade-in">Services</h2>
        <div class="row">
            <div class="col-md-3 mb-4">
                <div class="card fade-in">
                    <img src="/images/welcome/apartmentnew.jpg" class="card-img-top" alt="Apartment">
                    <div class="card-body text-center">
                        <h5 class="card-title">Apartment</h5>
                        <p class="card-text">A multi-level structure offering above-ground interment, our apartment-style crypts provide a dignified and space-efficient burial option. Each unit is designed for ease of access and maintenance, making it an ideal choice for families seeking secure, long-term memorialization.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card fade-in delay-100">
                    <img src="/images/welcome/boneniche.jpg" class="card-img-top" alt="Bone Niche">
                    <div class="card-body text-center">
                        <h5 class="card-title">Bone Niche</h5>
                        <p class="card-text">Bone niches offer a sacred and compact resting place for exhumed remains or cremated bones. Often placed within columbarium walls, these niches provide a respectful and culturally appropriate option for families preserving ancestral heritage.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card fade-in delay-200">
                    <img src="/images/welcome/familylawnlot.jpg" class="card-img-top" alt="Family Lawn Lots">
                    <div class="card-body text-center">
                        <h5 class="card-title">Family Lawn Lots</h5>
                        <p class="card-text">Family lawn lots are spacious ground burial plots designed to accommodate multiple family members. Surrounded by landscaped greenery, these lots offer a serene and lasting tribute for generations, encouraging family unity in remembrance.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card fade-in delay-300">
                    <img src="/images/welcome/private.jpg" class="card-img-top" alt="Private">
                    <div class="card-body text-center">
                        <h5 class="card-title">Private</h5>
                        <p class="card-text">Private graves provide individual burial spaces in peaceful, well-maintained sections of the cemetery. These plots offer a quiet, personal setting for remembrance and are suitable for families who prefer a more secluded and intimate resting place for their loved ones.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <footer class="footer">
        <div class="container text-center">
            <span>&copy; 2025 DCCMS Memorial Services. All rights reserved.</span>
        </div>
    </footer>
</div>

<!-- Animation JavaScript -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Show hero elements immediately on load
        setTimeout(function() {
            document.querySelectorAll('.hero-text').forEach(function(element) {
                element.classList.add('visible');
            });
        }, 300);
        
        // Track scroll position to handle scroll direction
        let lastScrollTop = 0;
        
        // Check if elements are in viewport on initial load
        checkVisibility();
        
        // Check when scrolling
        window.addEventListener('scroll', function() {
            const st = window.pageYOffset || document.documentElement.scrollTop;
            checkVisibility(st > lastScrollTop ? 'down' : 'up');
            lastScrollTop = st <= 0 ? 0 : st; // For Mobile or negative scrolling
        });
        
        function checkVisibility(direction = 'down') {
            const elements = document.querySelectorAll('.fade-in');
            
            elements.forEach(function(element) {
                // Skip the footer element
                if (element.closest('.footer')) return;
                
                // Get element position relative to viewport
                const rect = element.getBoundingClientRect();
                const windowHeight = window.innerHeight || document.documentElement.clientHeight;
                
                // Different thresholds for different scroll directions
                const threshold = direction === 'down' ? 100 : 150;
                
                // If element is in viewport
                if (rect.top <= windowHeight - threshold && rect.bottom >= threshold) {
                    element.classList.add('visible');
                } else if (direction === 'up' && (rect.bottom < 0 || rect.top > windowHeight)) {
                    // Remove visible class when element is completely out of viewport when scrolling up
                    element.classList.remove('visible');
                }
            });
        }
    });
</script>
@endsection
