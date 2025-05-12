@extends('layouts.header')

@section('styles')
    <!-- Link to Bootstrap CSS -->
    <link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}">
    
    <!-- Existing styles for MapLibre and your custom CSS -->
    <link href="https://unpkg.com/maplibre-gl@3.6.2/dist/maplibre-gl.css" rel="stylesheet" />
    <link href="{{ asset('css/map.css') }}" rel="stylesheet" />
    
    <!-- SweetAlert2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
    
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
                    
                    <form id="applicationForm" action="{{ route('application.store') }}" method="POST" class="needs-validation" novalidate>
                        @csrf
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="firstName" class="form-label">First Name <span class="text-danger">*</span></label>
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
                            <label for="lastName" class="form-label">Last Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control @error('lastName') is-invalid @enderror" 
                                id="lastName" name="lastName" placeholder="Dela Cruz" required value="{{ old('lastName') }}">
                            @error('lastName')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label d-block">Gender <span class="text-danger">*</span></label>
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
                            <label for="email" class="form-label">Email Address <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                <input type="email" class="form-control @error('email') is-invalid @enderror" 
                                    id="email" name="email" placeholder="example@example.com" required 
                                    value="{{ old('email') }}" oninput="validateEmail(this)">
                                <span class="input-group-text" id="emailLoading" style="display: none;">
                                    <div class="spinner-border spinner-border-sm text-primary" role="status">
                                        <span class="visually-hidden">Loading...</span>
                                    </div>
                                </span>
                                @error('email')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="form-text">
                                <i>Your email will be used to send notifications about the status of your grave space or to inform if it has expired, needs renewal, or relocation.</i>
                            </div>
                            <div id="emailError" class="text-danger small mt-1" style="display: none;"></div>
                            <div id="emailSuccess" class="text-success small mt-1" style="display: none;">Email is available</div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="mobile" class="form-label">Contact Number <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-phone"></i></span>
                                <input type="text" class="form-control @error('mobile') is-invalid @enderror" 
                                    id="mobile" name="mobile" placeholder="09XXXXXXXXX" 
                                    pattern="^09\d{9}$" maxlength="11" required value="{{ old('mobile') }}"
                                    oninput="validatePhoneNumber(this)">
                                @error('mobile')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="form-text">Enter your 11-digit mobile number starting with "09" (e.g., 09123456789)</div>
                            <div id="phoneError" class="text-danger small mt-1" style="display: none;">Phone number must start with "09"</div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Address <span class="text-danger">*</span></label>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="country" class="form-label">Country <span class="text-danger">*</span></label>
                                    <select class="form-select" id="country" name="country" required disabled>
                                        <option value="PH" selected>Philippines</option>
                                    </select>
                                    <input type="hidden" name="country" value="PH">
                                </div>
                                <div class="col-md-6">
                                    <label for="region" class="form-label">Region <span class="text-danger">*</span></label>
                                    <select class="form-select" id="region" name="region" required>
                                        <option value="10" selected>Northern Mindanao</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="province" class="form-label">Province <span class="text-danger">*</span></label>
                                    <select class="form-select" id="province" name="province" required>
                                        <option value="1013" selected>Bukidnon</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="city" class="form-label">City/Municipality <span class="text-danger">*</span></label>
                                    <select class="form-select" id="city" name="city" required>
                                        <option value="">Select City/Municipality</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="barangay" class="form-label">Barangay <span class="text-danger">*</span></label>
                                    <select class="form-select" id="barangay" name="barangay" required>
                                        <option value="">Select Barangay</option>
                                    </select>
                                </div>
                                <div class="col-12">
                                    <label for="street" class="form-label">Street/Purok <span class="text-muted">(optional)</span></label>
                                    <input type="text" class="form-control" id="street" name="street" placeholder="Enter your street address">
                                </div>
                            </div>
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label d-block">Service Type<span class="text-danger">*</span></label>
                            <div class="d-flex flex-column gap-2">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="service_to_avail" id="apartment" value="Apartment" required {{ old('service_to_avail') == 'Apartment' ? 'checked' : '' }}>
                                    <label class="form-check-label" for="apartment">Apartment</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="service_to_avail" id="family_lawn" value="Family Lawn Lot" required {{ old('service_to_avail') == 'Family Lawn Lot' ? 'checked' : '' }}>
                                    <label class="form-check-label" for="family_lawn">Family Lawn Lot</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="service_to_avail" id="private" value="Private" required {{ old('service_to_avail') == 'Private' ? 'checked' : '' }}>
                                    <label class="form-check-label" for="private">Private</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="service_to_avail" id="bone_niche" value="Bone Niche" required {{ old('service_to_avail') == 'Bone Niche' ? 'checked' : '' }}>
                                    <label class="form-check-label" for="bone_niche">Bone Niche</label>
                                </div>
                            </div>
                            <div class="form-text mt-2">
                                <i>Please select the service you wish to avail.</i>
                            </div>
                            @error('service_to_avail')
                                <div class="text-danger small mt-1">{{ $message }}</div>
                            @enderror
                        </div>
                        
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-dark btn-lg" id="submitBtn">Submit Application</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Success Modal -->
<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-0">
                <h5 class="modal-title" id="successModalLabel">Application Submitted Successfully!</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">
                <div class="mb-4">
                    <i class="bi bi-check-circle-fill text-success" style="font-size: 4rem;"></i>
                </div>
                <p class="mb-3">Thank you for submitting your application. We will review your application and send you an email notification once it is approved.</p>
                <p class="text-muted small">Please check your email regularly for updates regarding your application status.</p>
            </div>
            <div class="modal-footer border-0">
                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
@endsection

@section('scripts')
<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
let emailTimeout;

function validateEmail(input) {
    const email = input.value.trim();
    const emailError = document.getElementById('emailError');
    const emailSuccess = document.getElementById('emailSuccess');
    const emailLoading = document.getElementById('emailLoading');
    
    // Clear previous timeout
    clearTimeout(emailTimeout);
    
    // Hide both messages initially
    emailError.style.display = 'none';
    emailSuccess.style.display = 'none';
    emailLoading.style.display = 'none';
    
    // Basic email format validation
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        emailError.textContent = 'Please enter a valid email address';
        emailError.style.display = 'block';
        input.setCustomValidity('Please enter a valid email address');
        return;
    }
    
    // Wait for user to stop typing (500ms) before checking database
    emailTimeout = setTimeout(() => {
        emailLoading.style.display = 'inline-flex';
        
        fetch(`/check-email/${encodeURIComponent(email)}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                if (data.error) {
                    throw new Error(data.message || data.error);
                }
                
                if (data.exists) {
                    emailError.textContent = data.message || 'This email is already registered in our system';
                    emailError.style.display = 'block';
                    emailSuccess.style.display = 'none';
                    input.setCustomValidity(data.message || 'This email is already registered in our system');
                } else {
                    emailError.style.display = 'none';
                    emailSuccess.style.display = 'block';
                    emailSuccess.textContent = data.message || 'Email is available';
                    input.setCustomValidity('');
                }
            })
            .catch(error => {
                console.error('Error checking email:', error);
                emailError.textContent = error.message || 'Error checking email availability. Please try again.';
                emailError.style.display = 'block';
                emailSuccess.style.display = 'none';
                input.setCustomValidity(error.message || 'Error checking email availability');
            })
            .finally(() => {
                emailLoading.style.display = 'none';
            });
    }, 500);
}

function validatePhoneNumber(input) {
    // Remove any non-numeric characters
    input.value = input.value.replace(/[^0-9]/g, '');
    
    // Limit to 11 digits
    if (input.value.length > 11) {
        input.value = input.value.substring(0, 11);
    }
    
    // Check if number starts with "09"
    const phoneError = document.getElementById('phoneError');
    if (input.value.length > 0 && !input.value.startsWith('09')) {
        phoneError.style.display = 'block';
        input.setCustomValidity('Phone number must start with "09"');
    } else {
        phoneError.style.display = 'none';
        input.setCustomValidity('');
    }
}

document.addEventListener('DOMContentLoaded', function() {
    const regionSelect = document.getElementById('region');
    const provinceSelect = document.getElementById('province');
    const citySelect = document.getElementById('city');
    const barangaySelect = document.getElementById('barangay');

    // Load initial cities for Bukidnon (province_id: 1013)
    loadCities('1013');

    // Event listeners for cascading dropdowns
    regionSelect.addEventListener('change', function() {
        loadProvinces(this.value);
    });

    provinceSelect.addEventListener('change', function() {
        if (this.value) {
            loadCities(this.value);
        } else {
            citySelect.innerHTML = '<option value="">Select City/Municipality</option>';
            barangaySelect.innerHTML = '<option value="">Select Barangay</option>';
        }
    });

    citySelect.addEventListener('change', function() {
        if (this.value) {
            loadBarangays(this.value);
        } else {
            barangaySelect.innerHTML = '<option value="">Select Barangay</option>';
        }
    });

    // Function to load provinces
    function loadProvinces(regionId) {
        console.log('Loading provinces for region:', regionId);
        fetch(`/address/provinces/${regionId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Province data:', data);
                provinceSelect.innerHTML = '<option value="">Select Province</option>';
                if (data.provinces && Array.isArray(data.provinces)) {
                    data.provinces.forEach(province => {
                        const option = document.createElement('option');
                        option.value = province.id;
                        option.textContent = province.name;
                        provinceSelect.appendChild(option);
                    });
                }
                // Clear dependent dropdowns
                citySelect.innerHTML = '<option value="">Select City/Municipality</option>';
                barangaySelect.innerHTML = '<option value="">Select Barangay</option>';
            })
            .catch(error => {
                console.error('Error loading provinces:', error);
                provinceSelect.innerHTML = '<option value="">Error loading provinces</option>';
            });
    }

    // Function to load cities
    function loadCities(provinceId) {
        console.log('Loading cities for province:', provinceId);
        fetch(`/address/cities/${provinceId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('City data:', data);
                citySelect.innerHTML = '<option value="">Select City/Municipality</option>';
                if (data.cities && Array.isArray(data.cities)) {
                    data.cities.forEach(city => {
                        const option = document.createElement('option');
                        option.value = city.id;
                        option.textContent = city.name;
                        citySelect.appendChild(option);
                    });
                }
                // Clear barangay dropdown
                barangaySelect.innerHTML = '<option value="">Select Barangay</option>';
            })
            .catch(error => {
                console.error('Error loading cities:', error);
                citySelect.innerHTML = '<option value="">Error loading cities</option>';
            });
    }

    // Function to load barangays
    function loadBarangays(cityId) {
        console.log('Loading barangays for city:', cityId);
        fetch(`/address/barangays/${cityId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Barangay data:', data);
                barangaySelect.innerHTML = '<option value="">Select Barangay</option>';
                if (data.barangays && Array.isArray(data.barangays)) {
                    data.barangays.forEach(barangay => {
                        const option = document.createElement('option');
                        option.value = barangay.id;
                        option.textContent = barangay.name;
                        barangaySelect.appendChild(option);
                    });
                }
            })
            .catch(error => {
                console.error('Error loading barangays:', error);
                barangaySelect.innerHTML = '<option value="">Error loading barangays</option>';
            });
    }
});

document.getElementById('applicationForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const form = this;
    const submitBtn = document.getElementById('submitBtn');
    const formData = new FormData(form);
    
    // Disable submit button and show loading state
    submitBtn.disabled = true;
    submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Submitting...';
    
    fetch(form.action, {
        method: 'POST',
        body: formData,
        headers: {
            'X-Requested-With': 'XMLHttpRequest'
        }
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Show success message using SweetAlert2
            Swal.fire({
                icon: 'success',
                title: 'Application Submitted Successfully!',
                html: `
                    <p class="mb-3">Thank you for submitting your application. We will review your application and send you an email notification once it is approved.</p>
                    <p class="text-muted">Once your application is approved, you may proceed to the Municipal Hall to avail or purchase a grave space.</p>
                `,
                confirmButtonText: 'Close',
                confirmButtonColor: '#212529'
            }).then((result) => {
                // Reset form
                form.reset();
                
                // Clear any validation states
                form.classList.remove('was-validated');
                
                // Reset email validation states
                document.getElementById('emailError').style.display = 'none';
                document.getElementById('emailSuccess').style.display = 'none';

                // Redirect to welcome page
                window.location.href = '{{ route("welcome") }}';
            });
        } else {
            // Handle validation errors
            if (data.errors) {
                Object.keys(data.errors).forEach(field => {
                    const input = form.querySelector(`[name="${field}"]`);
                    if (input) {
                        input.classList.add('is-invalid');
                        const feedback = input.nextElementSibling;
                        if (feedback && feedback.classList.contains('invalid-feedback')) {
                            feedback.textContent = data.errors[field][0];
                        }
                    }
                });
            }
        }
    })
    .catch(error => {
        console.error('Error:', error);
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'An error occurred while submitting your application. Please try again.',
            confirmButtonColor: '#212529'
        });
    })
    .finally(() => {
        // Re-enable submit button
        submitBtn.disabled = false;
        submitBtn.innerHTML = 'Submit Application';
    });
});
</script>
@endsection

