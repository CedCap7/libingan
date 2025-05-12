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
                        <p class="card-text">
                            <strong>Price: ₱1,400</strong><br>
                            <span class="text-muted">Duration: 8 years</span><br><br>
                            Our apartment-style crypts offer an affordable and dignified above-ground interment solution. After the 8-year period, remains will be transferred to a bone niche for continued memorialization. This option is perfect for families seeking a temporary but respectful resting place with a clear transition plan.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card fade-in delay-100">
                    <img src="/images/welcome/boneniche.jpg" class="card-img-top" alt="Bone Niche">
                    <div class="card-body text-center">
                        <h5 class="card-title">Bone Niche</h5>
                        <p class="card-text">
                            <strong>Price: ₱8,000</strong><br>
                            <span class="text-muted">Permanent</span><br><br>
                            Our bone niches provide a permanent, sacred resting place for exhumed remains. These compact, well-maintained spaces are designed for long-term memorialization, offering a respectful and culturally appropriate option for preserving ancestral heritage. Ideal for families seeking a permanent solution for their loved ones' remains.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card fade-in delay-200">
                    <img src="/images/welcome/familylawnlot.jpg" class="card-img-top" alt="Family Lawn Lots">
                    <div class="card-body text-center">
                        <h5 class="card-title">Family Lawn Lots</h5>
                        <p class="card-text">
                            <strong>Price: ₱100,000</strong><br>
                            <span class="text-muted">Permanent Ownership</span><br><br>
                            Family lawn lots offer permanent ownership of spacious ground burial plots, perfect for multiple family members. These exclusive spaces come with perpetual care and maintenance, ensuring a serene and lasting tribute for generations. Includes landscaping, maintenance, and the right to pass ownership to family members.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card fade-in delay-300">
                    <img src="/images/welcome/private.jpg" class="card-img-top" alt="Private">
                    <div class="card-body text-center">
                        <h5 class="card-title">Private</h5>
                        <p class="card-text">
                            <strong>Price: ₱20,000</strong><br>
                            <span class="text-muted">Permanent Ownership</span><br><br>
                            Private graves provide individual burial spaces with permanent ownership rights. These exclusive plots offer a peaceful, personal setting for remembrance in well-maintained sections of the cemetery. Includes perpetual care, maintenance, and the freedom to personalize the space according to your preferences.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Us Section -->
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="text-center mb-5 fade-in">
                    <h2 class="mb-3">Contact Us</h2>
                    <p class="lead">We're here to help you with any questions about our memorial services</p>
                </div>
                <div class="row g-4">
                    <div class="col-md-4 text-center fade-in delay-100">
                        <div class="p-4 bg-white rounded shadow-sm h-100">
                            <i class="bi bi-geo-alt-fill text-primary mb-3" style="font-size: 2rem;"></i>
                            <h5 class="mb-3">Visit Us</h5>
                            <p class="mb-0">Municipal Hall<br>Don Carlos, Bukidnon</p>
                        </div>
                    </div>
                    <div class="col-md-4 text-center fade-in delay-200">
                        <div class="p-4 bg-white rounded shadow-sm h-100">
                            <i class="bi bi-telephone-fill text-primary mb-3" style="font-size: 2rem;"></i>
                            <h5 class="mb-3">Call Us</h5>
                            <p class="mb-0">(123) 456-7890<br>Mon-Fri, 8AM-5PM</p>
                        </div>
                    </div>
                    <div class="col-md-4 text-center fade-in delay-300">
                        <div class="p-4 bg-white rounded shadow-sm h-100">
                            <i class="bi bi-envelope-fill text-primary mb-3" style="font-size: 2rem;"></i>
                            <h5 class="mb-3">Email Us</h5>
                            <p class="mb-0">info@dccms.com<br>support@dccms.com</p>
                        </div>
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
