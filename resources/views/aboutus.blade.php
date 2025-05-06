@extends('layouts.header')

<style>
    /* Base Styles */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
    }
    
    /* Hero Section */
    .about-hero {
        background-color: #343a40;
        color: white;
        padding: 5rem 0;
        position: relative;
    }
    
    .about-hero::after {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.7));
        z-index: 1;
    }
    
    .about-hero .container {
        position: relative;
        z-index: 2;
    }
    
    /* Content Styles */
    .section {
        padding: 5rem 0;
    }
    
    .section-title {
        margin-bottom: 3rem;
        position: relative;
        padding-bottom: 1rem;
    }
    
    .section-title::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 50px;
        height: 3px;
        background-color: #4361ee;
    }
    
    .feature-box {
        padding: 2rem;
        border-radius: 8px;
        box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        background-color: white;
        height: 100%;
        transition: transform 0.3s, box-shadow 0.3s;
    }
    
    .feature-box:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 20px rgba(0,0,0,0.15);
    }
    
    .icon-container {
        width: 70px;
        height: 70px;
        border-radius: 50%;
        background-color: #e9ecef;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 1.5rem;
    }
    
    .icon-container i {
        font-size: 1.8rem;
        color: #4361ee;
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
    
    /* Footer */
    .footer {
        background-color: #fff;
        padding: 1.5rem 0;
        box-shadow: 0 -2px 10px rgba(0,0,0,0.1);
    }
    
    /* Vision section */
    .vision-section {
        background-color: #4361ee;
        color: white;
        padding: 5rem 0;
    }
</style>

@section('content')
<!-- Hero Section -->
<div class="about-hero" style="background-image: url('/images/about/cemetery-bg.jpg');">
    <div class="container text-center">
        <h1 class="display-4 fw-bold fade-in">About DCCMS</h1>
        <p class="lead fade-in delay-200">Don Carlos Cemetery Management System</p>
    </div>
</div>

<!-- About Section -->
<div class="section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 mb-4 mb-lg-0">
                <h2 class="section-title fade-in">Our Purpose</h2>
                <p class="fade-in delay-100">The Don Carlos Cemetery Management System (DCCMS) is a digital platform developed to streamline and modernize the management of cemetery operations in the Municipality of Don Carlos. This system addresses long-standing challenges in recordkeeping, space tracking, and administrative efficiency.</p>
                <p class="fade-in delay-200">The main goal of DCCMS is to replace the traditional manual system of maintaining cemetery records with a reliable, digital alternative. By doing so, we aim to reduce errors, improve accessibility of data, and enhance transparency in managing interment records and lot availability.</p>
            </div>
            <div class="col-lg-6">
                <img src="/images/about/purpos.jpg" alt="DCCMS Dashboard" class="img-fluid rounded shadow-sm fade-in delay-300">
            </div>
        </div>
    </div>
</div>

<!-- Features Section -->
<div class="section bg-light">
    <div class="container">
        <h2 class="section-title text-center mb-5 fade-in">Key Features</h2>
        <div class="row g-4">
            <div class="col-md-6 col-lg-4 fade-in">
                <div class="feature-box">
                    <div class="icon-container">
                        <i class="fas fa-database"></i>
                    </div>
                    <h4>Digital Records Management</h4>
                    <p>Keep track of all deceased records, including burial information, plot location, and associated family data.</p>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-4 fade-in delay-100">
                <div class="feature-box">
                    <div class="icon-container">
                        <i class="fas fa-map-marked-alt"></i>
                    </div>
                    <h4>Interactive Cemetery Map</h4>
                    <p>Visualize the layout of the cemetery and easily locate available or occupied plots.</p>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-4 fade-in delay-200">
                <div class="feature-box">
                    <div class="icon-container">
                        <i class="fas fa-bell"></i>
                    </div>
                    <h4>Expiration & Notification System</h4>
                    <p>Automatically notifies administrators and families about expired burial terms for renewal or relocation.</p>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-4 fade-in delay-100">
                <div class="feature-box">
                    <div class="icon-container">
                        <i class="fas fa-search"></i>
                    </div>
                    <h4>Search & Filter Tools</h4>
                    <p>Quickly search for deceased individuals or available lots based on customizable filters.</p>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-4 fade-in delay-200">
                <div class="feature-box">
                    <div class="icon-container">
                        <i class="fas fa-tachometer-alt"></i>
                    </div>
                    <h4>Admin Dashboard</h4>
                    <p>Centralized control panel for authorized personnel to manage user access, plot availability, and system settings.</p>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-4 fade-in delay-300">
                <div class="feature-box">
                    <div class="icon-container">
                        <i class="fas fa-lock"></i>
                    </div>
                    <h4>Secure Access</h4>
                    <p>Role-based access control ensuring that sensitive data is only accessible to authorized personnel.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Users Section -->
<div class="section">
    <div class="container">
        <h2 class="section-title text-center mb-5 fade-in">Who Is It For?</h2>
        <div class="row g-4">
            <div class="col-md-4 fade-in">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body text-center p-4">
                        <div class="mb-4">
                            <i class="fas fa-city fa-3x text-primary"></i>
                        </div>
                        <h4>Local Government Units</h4>
                        <p>Simplifies cemetery management tasks and enhances service delivery to constituents.</p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4 fade-in delay-100">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body text-center p-4">
                        <div class="mb-4">
                            <i class="fas fa-user-tie fa-3x text-primary"></i>
                        </div>
                        <h4>Cemetery Caretakers</h4>
                        <p>Provides a convenient way to record and update burial activities and statuses.</p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4 fade-in delay-200">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body text-center p-4">
                        <div class="mb-4">
                            <i class="fas fa-users fa-3x text-primary"></i>
                        </div>
                        <h4>Residents</h4>
                        <p>Offers a transparent and accessible method to check lot availability and deceased information.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Vision Section -->
<div class="vision-section">
    <div class="container text-center fade-in">
        <h2 class="mb-4">Our Vision</h2>
        <p class="lead px-md-5 mx-md-5">To provide an efficient and transparent cemetery management experience for the Municipality of Don Carlos—promoting respectful, organized, and sustainable burial practices through digital innovation.</p>
    </div>
</div>

<!-- Footer Section -->
<footer class="footer">
    <div class="container text-center">
        <span>&copy; 2025 DCCMS Memorial Services. All rights reserved.</span>
    </div>
</footer>

<!-- Animation JavaScript -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
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