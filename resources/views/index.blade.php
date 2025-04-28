@extends('layouts.app')

@section('styles')
<link href='https://unpkg.com/maplibre-gl@3.6.2/dist/maplibre-gl.css' rel='stylesheet' />
<link href="{{ asset('css/map.css') }}" rel="stylesheet" />
<link href="{{ asset('css/bootstrap.css') }}" rel="stylesheet" />
@endsection

@section('content')
<div class="top-controls">
    <div class="search-wrapper">
        <input style="width: 370px; height: 55px; border-radius: 15px" type="text" id="search-input" placeholder="Search by name...">
        <div class="button-group">
            <button id="clear-search" class="clear-button">
                <img src="{{ asset('images/X.png') }}" alt="Clear Search">
            </button>
            <button id="reset-view" class="reset-button">
                <img src="{{ asset('images/resetmapview.png') }}" alt="Reset Map View">
            </button>
            <button id="go-welcome" class="reset-button" onclick="window.location.href='{{ url('/welcome') }}'">
                <img src="{{ asset('images/home.png') }}" alt="Go To Home Page">
            </button>
        </div>
        <div style="width: 350px; left: 10px; border-radius: 5px" id="search-results" class="search-results"></div>
    </div>
</div>
<div id="map"></div>
@endsection

@section('scripts')
<script src='https://unpkg.com/maplibre-gl@3.6.2/dist/maplibre-gl.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.9.0/proj4.js"></script>
<script>
    // Define the API base URL at the top of your script
    const apiBaseUrl = '{{ url('/api') }}';
    let selectedFeatureId = null;
    let selectedFeatureSource = null;
    let searchTimeout = null;
    let highlightedFeatures = [];
    let currentPopup = null;

    // Convert projected coordinates to geographic coordinates (EPSG:3857 to EPSG:4326)
    const sw = proj4('EPSG:3857', 'EPSG:4326', [13913830.7403368949890137, 858724.7877268618904054]);
    const ne = proj4('EPSG:3857', 'EPSG:4326', [13914284.9606690797954798, 859045.6364505873061717]);

    // Calculate the center of the image
    const center = [
        (sw[0] + ne[0]) / 2, // Average longitude
        (sw[1] + ne[1]) / 2  // Average latitude
    ];

    // Initialize map with higher zoom
    const map = new maplibregl.Map({
        container: 'map',
        style: 'https://api.maptiler.com/maps/satellite/style.json?key=slSuwEtNY8loqQWUZ9IO',
        center: center,
        zoom: 16.9,
        bearing: 12,
        maxZoom: 24,
        minZoom: 16.9
    });

    // Add these event listeners after your map initialization
    const searchInput = document.getElementById('search-input');
    const clearButton = document.getElementById('clear-search');
    const resultsContainer = document.getElementById('search-results');

    // Show/hide clear button based on search input
    searchInput.addEventListener('input', function(e) {
        const searchTerm = e.target.value.trim();
        
        // Clear previous timeout and highlights
        if (searchTimeout) {
            clearTimeout(searchTimeout);
        }
        clearHighlightedFeatures();
        
        // Hide results if search term is empty
        if (!searchTerm) {
            resultsContainer.style.display = 'none';
            return;
        }

        // Show loading state immediately
        resultsContainer.style.display = 'block';
        resultsContainer.innerHTML = '<div class="loading">Searching...</div>';
        
        // Reduce debounce time from 300ms to 150ms
        searchTimeout = setTimeout(() => {
            fetch(`/search?term=${encodeURIComponent(searchTerm)}`)
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }
                    return response.json();
                })
                .then(data => {
                    // Process search results
                    displaySearchResults(data);
                })
                .catch(error => {
                    console.error('Search error:', error);
                    resultsContainer.innerHTML = '<div class="no-results">Error performing search</div>';
                });
        }, 150); // Reduced from 300ms to 150ms
    });

    // Clear search when button is clicked
    clearButton.addEventListener('click', function() {
        searchInput.value = '';
        resultsContainer.style.display = 'none';
        clearHighlightedFeatures();
    });

    // Helper function to display search results
    function displaySearchResults(data) {
        console.log('Search Results Data:', data);
        
        if (!Array.isArray(data) || data.length === 0) {
            resultsContainer.innerHTML = '<div class="no-results">No results found</div>';
            return;
        }

        // Create a bounds object to encompass all results
        let searchBounds = new maplibregl.LngLatBounds();
        let hasValidFeatures = false;
        
        // Process and highlight matching plots
        data.forEach(person => {
            if (!person) return;
            
            const { Plot_ID, plot_type } = person;
            if (!Plot_ID || !plot_type) return;
            
            const layerName = getLayerNameFromType(plot_type);
            if (!layerName) return;
            
            // Get the source and feature
            const source = map.getSource(layerName);
            if (!source || !source._data) return;

            const feature = source._data.features.find(f => 
                f.properties && String(f.properties.id) === String(Plot_ID)
            );
            
            if (feature && feature.geometry && feature.geometry.coordinates) {
                // Extend bounds with this feature's coordinates
                feature.geometry.coordinates[0].forEach(coord => {
                    searchBounds.extend(coord);
                });
                hasValidFeatures = true;
                
                // Highlight the feature
                highlightFeature(layerName, Plot_ID);
            }
        });
        
        // Display results
        resultsContainer.innerHTML = data.map(person => `
            <div class="search-result-item" 
                 data-plot-id="${person.Plot_ID || ''}"
                 data-plot-type="${person.plot_type || ''}"
                 data-deceased-id="${person.Deceased_ID || ''}"
                 data-level="${person.Level || ''}">
                <div>${person.FirstName || ''} ${person.MiddleName ? person.MiddleName.charAt(0) + '.' : ''} ${person.LastName || ''}</div>
                <small>${person.plot_type ? getPlotType(person.plot_type) : ''} - Block ${person.block || ''}, Section ${person.section || ''}, Row ${person.row || ''}, Plot ${person.plot || ''}</small>
            </div>
        `).join('');

        // Add hover handlers to search results
        const searchResults = document.querySelectorAll('.search-result-item');
        searchResults.forEach(result => {
            result.addEventListener('mouseenter', function() {
                const plotId = this.dataset.plotId;
                const plotType = this.dataset.plotType;
                const layerName = getLayerNameFromType(plotType);
                
                // Find the feature
                const source = map.getSource(layerName);
                if (source && source._data) {
                    const feature = source._data.features.find(f => 
                        f.properties && String(f.properties.id) === String(plotId)
                    );
                    
                    if (feature && feature.geometry && feature.geometry.coordinates) {
                        // Calculate bounds of the feature
                        const bounds = new maplibregl.LngLatBounds();
                        feature.geometry.coordinates[0].forEach(coord => {
                            bounds.extend(coord);
                        });
                        
                        // Zoom to the feature
                        map.fitBounds(bounds, {
                            padding: 50,
                            maxZoom: 21.7,
                            duration: 500, // Faster animation for hover
                            bearing: 12,
                            pitch: 0
                        });
                    }
                }
            });

            // Add mouseleave handler to zoom back out to all results
            result.addEventListener('mouseleave', function() {
                if (hasValidFeatures) {
                    map.fitBounds(searchBounds, {
                        padding: 50,
                        maxZoom: 21.7,
                        duration: 500,
                        bearing: 12,
                        pitch: 0
                    });
                }
            });
        });

        // If we have valid features, fit the map to show all results
        if (hasValidFeatures) {
            map.fitBounds(searchBounds, {
                padding: 50,
                maxZoom: 21.7,
                duration: 1000,
                bearing: 12,
                pitch: 0
            });
        }
    }

    // Update the search results click handler
    document.getElementById('search-results').addEventListener('click', async function(e) {
        const resultItem = e.target.closest('.search-result-item');
        if (!resultItem) return;
        
        // Clear search input and results
        document.getElementById('search-input').value = '';
        this.style.display = 'none';
        
        // Get data attributes
        const plotId = resultItem.dataset.plotId;
        const plotType = resultItem.dataset.plotType;
        const deceasedId = resultItem.dataset.deceasedId;
        
        console.log('Clicked result data:', { plotId, plotType, deceasedId });

        // Clear existing highlights and popups
        clearHighlightedFeatures();
        if (currentPopup) {
            currentPopup.remove();
            currentPopup = null;
        }

        try {
            // Fetch deceased records
            const response = await fetch(`/deceased/${plotId}`);
            const deceased = await response.json();
            
            console.log('Fetched deceased records:', deceased);
            
            // Find the clicked record by Deceased_ID
            const clickedRecord = deceased.find(person => 
                String(person.Deceased_ID) === String(resultItem.dataset.deceasedId)
            );
            
            if (!clickedRecord) {
                console.error('Could not find clicked record');
                return;
            }

            // Get records from the same level (if applicable)
            const targetLevel = clickedRecord.Level;
            const sameLeveRecords = deceased.filter(person => person.Level === targetLevel);
            const targetIndex = sameLeveRecords.findIndex(person => 
                String(person.Deceased_ID) === String(clickedRecord.Deceased_ID)
            );

            // Get feature properties for header
            const layerName = getLayerNameFromType(plotType);
            const source = map.getSource(layerName);
            const feature = source._data.features.find(f => 
                String(f.properties.id) === String(plotId)
            );

            if (!feature) {
                console.error('Could not find feature');
                return;
            }

            // Calculate bounds for zooming
            const bounds = new maplibregl.LngLatBounds();
            feature.geometry.coordinates[0].forEach(coord => {
                bounds.extend(coord);
            });

            // Zoom to the feature
            map.fitBounds(bounds, {
                padding: 50,
                maxZoom: 21.7,
                duration: 1000,
                bearing: 12,
                pitch: 0
            });

            const props = feature.properties;
            const plotTypeString = getPlotType(plotType);
            const plotHeader = `${plotTypeString} - Block ${formatValue(props.block)}, Section ${formatValue(props.section)}, Row ${formatValue(props.row)}, Plot ${formatValue(props.plot)}`;
            
            let popupContent = `
                <div class="popup-content">
                    <h3 class="plot-header">${plotHeader}</h3>
                    <hr class="header-divider">
                    <div class="plot-details">
                        <div class="carousel">
                            <div class="carousel__viewport">
                                ${sameLeveRecords.map((person, index) => `
                                    <div class="carousel__slide ${index === targetIndex ? 'active' : ''}" 
                                         data-index="${index}">
                                        <div class="deceased-details">
                                            <h2>${formatValue(person.FirstName)} ${formatMiddleName(person.MiddleName)} ${formatValue(person.LastName)}</h2>
                                            <h4><strong>Date of Birth:</strong> ${formatDate(person.DateOfBirth)}</h4>
                                            <h4><strong>Date of Death:</strong> ${formatDate(person.DateOfDeath)}</h4>
                                            <p>${index + 1} of ${sameLeveRecords.length}</p>
                                        </div>
                                    </div>
                                `).join('')}
                            </div>
                            ${sameLeveRecords.length > 1 ? `
                                <button class="carousel__prev">❮</button>
                                <button class="carousel__next">❯</button>
                            ` : ''}
                        </div>
                    </div>
                </div>
            `;

            currentPopup = new maplibregl.Popup()
                .setLngLat(bounds.getCenter())
                .setHTML(popupContent)
                .addTo(map);

            highlightFeature(layerName, plotId);
            initializeCarousel();
            if (targetIndex > 0) {
                const carousel = document.querySelector('.carousel__viewport');
                const slides = carousel.querySelectorAll('.carousel__slide');
                if (slides[targetIndex]) {
                    slides[targetIndex].scrollIntoView({ behavior: 'auto' });
                }
            }
        } catch (error) {
            console.error('Error handling click:', error);
        }
    });

    // Close search results when clicking outside
    document.addEventListener('click', function(e) {
        const searchWrapper = document.querySelector('.search-wrapper');
        const resultsContainer = document.getElementById('search-results');
        
        if (searchWrapper && resultsContainer && !searchWrapper.contains(e.target)) {
            resultsContainer.style.display = 'none';
        }
    });

    // Helper function to get layer name from plot type
    function getLayerNameFromType(type) {
        switch(String(type)) {
            case '1': return 'apartment';
            case '2': return 'lawnlots';
            case '3': return 'boneniche';
            case '4': return 'private';
            default: return '';
        }
    }

    // Function to convert type values - handle both string and number types
    function getPlotType(typeValue) {
        const type = String(typeValue);
        
        switch (type) {
            case '1':
            case 1:
                return 'Apartment';
            case '2':
            case 2:
                return 'Family Lawn Lots';
            case '3':
            case 3:
                return 'Bone Niche';
            case '4':
            case 4:
                return 'Private';
            default:
                return 'N/A';
        }
    }

    // Function to handle null/empty values
    function formatValue(value) {
        return value === null || value === undefined || value === '' ? 'N/A' : value;
    }

    // Function to format dates
    function formatDate(dateString) {
        if (!dateString) return 'N/A';
        const date = new Date(dateString);
        if (isNaN(date.getTime())) return 'N/A';
        
        return date.toLocaleDateString('en-US', {
            year: 'numeric',
            month: 'long',
            day: 'numeric'
        });
    }

    // Function to format middle name as initial
    function formatMiddleName(middleName) {
        if (!middleName) return '';
        return middleName.charAt(0) + '.';
    }

    map.on('style.load', () => {
        // Add the georeferenced image
        map.addSource('cemetery-map', {
            'type': 'image',
            'url': '{{ asset('images/CemeteryMap_georeferenced.png') }}',
            'coordinates': [
                [sw[0], ne[1]],
                [ne[0], ne[1]],
                [ne[0], sw[1]],
                [sw[0], sw[1]]
            ]
        });

        map.addLayer({
            'id': 'cemetery-map-layer',
            'type': 'raster',
            'source': 'cemetery-map',
            'paint': {
                'raster-opacity': 0.85
            }
        });

        // Add GeoJSON layers
        const geojsonFiles = ['lawnlots', 'private', 'boneniche', 'apartment'];
        let selectedFeatureId = null;
        let selectedFeatureSource = null;

        geojsonFiles.forEach(file => {
            console.log(`Fetching GeoJSON for ${file}`);
            fetch(`/data/${file}.geojson`)
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }
                    return response.json();
                })
                .then(data => {
                    console.log(`Data loaded for ${file}:`, data);

                    // Convert coordinates from EPSG:3857 to EPSG:4326
                    data.features.forEach(feature => {
                        if (feature.geometry && feature.geometry.coordinates) {
                            if (feature.geometry.type === 'Polygon') {
                                feature.geometry.coordinates[0] = feature.geometry.coordinates[0].map(coord => {
                                    const converted = proj4('EPSG:3857', 'EPSG:4326', coord);
                                    return converted;
                                });
                            }
                        }
                    });

                    // Add unique IDs to features
                    data.features = data.features.map((feature, index) => {
                        feature.id = index;
                        return feature;
                    });

                    console.log(`Converted coordinates for ${file}:`, data.features[0].geometry.coordinates);

                    map.addSource(file, {
                        type: 'geojson',
                        data: data
                    });

                    // Add the main layer
                    map.addLayer({
                        'id': `${file}-layer`,
                        'type': 'fill',
                        'source': file,
                        'paint': {
                            'fill-color': [
                                'case',
                                ['boolean', ['feature-state', 'highlighted'], false],
                                '#ffff00', // highlighted color (yellow)
                                ['boolean', ['feature-state', 'selected'], false],
                                '#ffff00', // selected color (yellow)
                                ['boolean', ['feature-state', 'hover'], false],
                                '#ffff00', // hover color (yellow)
                                getColorForLayer(file) // default color
                            ],
                            'fill-opacity': [
                                'case',
                                ['boolean', ['feature-state', 'highlighted'], false],
                                1, // highlighted opacity
                                ['boolean', ['feature-state', 'selected'], false],
                                1, // selected opacity
                                ['boolean', ['feature-state', 'hover'], false],
                                1, // hover opacity
                                0.8 // default opacity
                            ],
                            'fill-outline-color': '#ffffff'
                        }
                    });

                    let hoveredFeatureId = null;

                    // Handle mousemove events
                    map.on('mousemove', `${file}-layer`, (e) => {
                        if (e.features.length > 0) {
                            map.getCanvas().style.cursor = 'pointer';
                            
                            if (hoveredFeatureId !== null) {
                                map.setFeatureState(
                                    { source: file, id: hoveredFeatureId },
                                    { hover: false }
                                );
                            }

                            hoveredFeatureId = e.features[0].id;
                            map.setFeatureState(
                                { source: file, id: hoveredFeatureId },
                                { hover: true }
                            );
                        }
                    });

                    // Handle mouseleave events
                    map.on('mouseleave', `${file}-layer`, () => {
                        if (hoveredFeatureId !== null) {
                            map.setFeatureState(
                                { source: file, id: hoveredFeatureId },
                                { hover: false }
                            );
                        }
                        hoveredFeatureId = null;
                        map.getCanvas().style.cursor = '';
                    });

                    // Click event for selection, popups, and zoom
                    map.on('click', `${file}-layer`, (e) => {
                        if (e.features.length > 0) {
                            const clickedFeature = e.features[0];
                            const props = clickedFeature.properties;

                            // Clear previous selection if it exists
                            if (selectedFeatureId !== null && selectedFeatureSource !== null) {
                                map.setFeatureState(
                                    { source: selectedFeatureSource, id: selectedFeatureId },
                                    { selected: false }
                                );
                            }

                            // Set new selection
                            selectedFeatureId = clickedFeature.id;
                            selectedFeatureSource = file;
                            map.setFeatureState(
                                { source: file, id: selectedFeatureId },
                                { selected: true }
                            );

                            // Get the bounds of the clicked feature
                            const coordinates = clickedFeature.geometry.coordinates[0];
                            const bounds = coordinates.reduce((bounds, coord) => {
                                return bounds.extend(coord);
                            }, new maplibregl.LngLatBounds(coordinates[0], coordinates[0]));

                            // Zoom to the feature with padding and no rotation
                            map.fitBounds(bounds, {
                                padding: 50,
                                maxZoom: 21.7,
                                duration: 1000,
                                bearing: 12,
                                pitch: 0
                            });

                            // Fetch deceased records for this plot
                            fetch(`/deceased/${props.id}`)
                                .then(response => response.json())
                                .then(deceased => {
                                    const plotType = getPlotType(props.type);
                                    const plotHeader = `${plotType}, Block ${formatValue(props.block)}, Section ${formatValue(props.section)}, Row ${formatValue(props.row)}, Plot ${formatValue(props.plot)}`;
                                    
                                    // Only show levels for apartments and bone niches
                                    const showLevels = props.type === '1' || props.type === 1 || props.type === '3' || props.type === 3;
                                    
                                    if (showLevels) {
                                        // Group deceased records by level
                                        const recordsByLevel = deceased.reduce((acc, person) => {
                                            const level = person.Level || 'Unknown';
                                            if (!acc[level]) acc[level] = [];
                                            acc[level].push(person);
                                            return acc;
                                        }, {});

                                        // Create level buttons HTML
                                        const levelButtonsHTML = Object.keys(recordsByLevel)
                                            .sort()
                                            .map(level => `
                                                <button class="level-btn" data-level="${level}">
                                                    Level ${level}
                                                </button>
                                            `).join('');

                                        // Create records display HTML for each level with carousel
                                        const recordsContainerHTML = Object.entries(recordsByLevel)
                                            .map(([level, records]) => `
                                                <div class="level-records" id="level-${level}-records" style="display: none;">
                                                    <button class="back-button">← Back</button>
                                                    <div class="carousel">
                                                        <div class="carousel__viewport">
                                                            ${records.map((person, index) => `
                                                                <div class="carousel__slide" data-index="${index}">
                                                                    <div class="deceased-details">
                                                                        <h2>${formatValue(person.FirstName)} ${formatMiddleName(person.MiddleName)} ${formatValue(person.LastName)}</h2>
                                                                        <h4><strong>Date of Birth:</strong> ${formatDate(person.DateOfBirth)}</h4>
                                                                        <h4><strong>Date of Death:</strong> ${formatDate(person.DateOfDeath)}</h4>
                                                                        <p>${index + 1} of ${records.length}</p>
                                                                    </div>
                                                                </div>
                                                            `).join('')}
                                                        </div>
                                                        ${records.length > 1 ? `
                                                            <button class="carousel__prev">❮</button>
                                                            <button class="carousel__next">❯</button>
                                                        ` : ''}
                                                    </div>
                                                </div>
                                            `).join('');

                                        let popupContent = `
                                            <div class="popup-content">
                                                <h3 class="plot-header">${plotHeader}</h3>
                                                <hr class="header-divider">
                                                <div class="plot-details">
                                                    ${deceased.length > 0 
                                                        ? `<div class="level-buttons">${levelButtonsHTML}</div>
                                                           <div class="records-container">${recordsContainerHTML}</div>`
                                                        : '<p>No records found for this plot.</p>'
                                                    }
                                                </div>
                                            </div>
                                        `;

                                        const popup = new maplibregl.Popup()
                                            .setLngLat(e.lngLat)
                                            .setHTML(popupContent)
                                            .addTo(map);

                                        // Add click handler using event delegation
                                        document.addEventListener('click', function(event) {
                                            if (event.target.matches('.level-btn')) {
                                                const level = event.target.getAttribute('data-level');
                                                
                                                // Hide level buttons
                                                const levelButtons = document.querySelector('.level-buttons');
                                                if (levelButtons) {
                                                    levelButtons.style.display = 'none';
                                                }
                                                
                                                // Show selected level's records
                                                const recordsContainer = document.getElementById(`level-${level}-records`);
                                                if (recordsContainer) {
                                                    recordsContainer.style.display = 'block';
                                                    
                                                    // Initialize carousel
                                                    const viewport = recordsContainer.querySelector('.carousel__viewport');
                                                    const slides = recordsContainer.querySelectorAll('.carousel__slide');
                                                    const totalSlides = slides.length;
                                                    let currentSlide = 0;

                                                    function updateCarousel() {
                                                        // Update slide position
                                                        viewport.scrollTo({
                                                            left: slides[currentSlide].offsetLeft,
                                                            behavior: 'smooth'
                                                        });

                                                        // Update navigation dots
                                                        recordsContainer.querySelectorAll('.carousel__navigation-button').forEach((dot, index) => {
                                                            dot.classList.toggle('active', index === currentSlide);
                                                        });
                                                    }

                                                    // Add click handlers for navigation
                                                    recordsContainer.querySelector('.carousel__prev')?.addEventListener('click', () => {
                                                        currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
                                                        updateCarousel();
                                                    });

                                                    recordsContainer.querySelector('.carousel__next')?.addEventListener('click', () => {
                                                        currentSlide = (currentSlide + 1) % totalSlides;
                                                        updateCarousel();
                                                    });

                                                    // Add click handlers for navigation dots
                                                    recordsContainer.querySelectorAll('.carousel__navigation-button').forEach(button => {
                                                        button.addEventListener('click', () => {
                                                            currentSlide = parseInt(button.getAttribute('data-index'));
                                                            updateCarousel();
                                                        });
                                                    });
                                                }
                                            }
                                            
                                            if (event.target.matches('.back-button')) {
                                                // Hide all record containers
                                                const allRecords = document.querySelectorAll('.level-records');
                                                allRecords.forEach(container => {
                                                    container.style.display = 'none';
                                                });
                                                
                                                // Show level buttons
                                                const levelButtons = document.querySelector('.level-buttons');
                                                if (levelButtons) {
                                                    levelButtons.style.display = 'flex';
                                                }
                                            }
                                        });
                                    } else {
                                        // For other types, show records directly in carousel without level selection
                                        let popupContent = `
                                            <div class="popup-content">
                                                <h3 class="plot-header">${plotHeader}</h3>
                                                <hr class="header-divider">
                                                <div class="plot-details">
                                                    ${deceased.length > 0 
                                                        ? `<div class="carousel">
                                                            <div class="carousel__viewport">
                                                                ${deceased.map((person, index) => `
                                                                    <div class="carousel__slide" data-index="${index}">
                                                                        <div class="deceased-details">
                                                                            <h2>${formatValue(person.FirstName)} ${formatMiddleName(person.MiddleName)} ${formatValue(person.LastName)}</h2>
                                                                            <h4><strong>Date of Birth:</strong> ${formatDate(person.DateOfBirth)}</h4>
                                                                            <h4><strong>Date of Death:</strong> ${formatDate(person.DateOfDeath)}</h4>
                                                                            <p>${index + 1} of ${deceased.length}</p>
                                                                        </div>
                                                                    </div>
                                                                `).join('')}
                                                            </div>
                                                            ${deceased.length > 1 ? `
                                                                <button class="carousel__prev">❮</button>
                                                                <button class="carousel__next">❯</button>
                                                                <div class="carousel__navigation">
                                                                    <ol class="carousel__navigation-list">
                                                                        ${deceased.map((_, index) => `
                                                                            <li class="carousel__navigation-item">
                                                                                <button class="carousel__navigation-button ${index === 0 ? 'active' : ''}" 
                                                                                        data-index="${index}">
                                                                                </button>
                                                                            </li>
                                                                        `).join('')}
                                                                    </ol>
                                                                </div>
                                                            ` : ''}
                                                        </div>`
                                                        : '<p>No records found for this plot.</p>'
                                                    }
                                                </div>
                                            </div>
                                        `;

                                        const popup = new maplibregl.Popup()
                                            .setLngLat(e.lngLat)
                                            .setHTML(popupContent)
                                            .addTo(map);

                                        // Initialize carousel for non-leveled plots
                                        if (deceased.length > 1) {
                                            const viewport = document.querySelector('.carousel__viewport');
                                            const slides = document.querySelectorAll('.carousel__slide');
                                            const totalSlides = slides.length;
                                            let currentSlide = 0;

                                            function updateCarousel() {
                                                // Update slide position
                                                viewport.scrollTo({
                                                    left: slides[currentSlide].offsetLeft,
                                                    behavior: 'smooth'
                                                });

                                                // Update navigation dots
                                                document.querySelectorAll('.carousel__navigation-button').forEach((dot, index) => {
                                                    dot.classList.toggle('active', index === currentSlide);
                                                });
                                            }

                                            // Add click handlers for navigation
                                            document.querySelector('.carousel__prev')?.addEventListener('click', () => {
                                                currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
                                                updateCarousel();
                                            });

                                            document.querySelector('.carousel__next')?.addEventListener('click', () => {
                                                currentSlide = (currentSlide + 1) % totalSlides;
                                                updateCarousel();
                                            });

                                            // Add click handlers for navigation dots
                                            document.querySelectorAll('.carousel__navigation-button').forEach(button => {
                                                button.addEventListener('click', () => {
                                                    currentSlide = parseInt(button.getAttribute('data-index'));
                                                    updateCarousel();
                                                });
                                            });
                                        }
                                    }
                                })
                                .catch(error => {
                                    console.error('Error fetching deceased records:', error);
                                });
                        }
                    });
                })
                .catch(error => {
                    console.error(`Error loading ${file}.geojson:`, error);
                });
        });

        // Add click handler for clearing selection when clicking outside plots
        map.on('click', (e) => {
            const features = map.queryRenderedFeatures(e.point);
            if (features.length === 0 && selectedFeatureId !== null && selectedFeatureSource !== null) {
                map.setFeatureState(
                    { source: selectedFeatureSource, id: selectedFeatureId },
                    { selected: false }
                );
                selectedFeatureId = null;
                selectedFeatureSource = null;
            }
        });

        // Fit bounds with a closer zoom
        map.fitBounds([sw, ne], {
            padding: 0,
            bearing: 12,
            zoom: 17.9
        });

        // Define the initial bounds of the georeferenced image
        const initialBounds = new maplibregl.LngLatBounds(sw, ne);

        // Add reset view functionality
        document.getElementById('reset-view').addEventListener('click', resetView);
    });

    // Function to determine color for each layer
    function getColorForLayer(name) {
        switch(name) {
            case 'lawnlots': return '#ff7f00';
            case 'private': return '#377eb8';
            case 'apartment': return '#4daf4a';
            case 'boneniche': return '#984ea3';
            default: return '#999999';
        }
    }

    map.on('error', (e) => {
        console.error('Map error:', e);
    });

    // Add these utility functions
    function clearHighlightedFeatures() {
        highlightedFeatures.forEach(({ source, id, marker }) => {
            // Remove feature state
            map.setFeatureState(
                { source, id },
                { highlighted: false }
            );
            // Remove marker if it exists
            if (marker && marker.remove) {
                marker.remove();
            }
        });
        highlightedFeatures = [];
    }

    // Update the highlightFeature function with more validation
    function highlightFeature(layerName, plotId) {
        try {
            // Validate inputs
            if (!layerName || !plotId) {
                console.warn('Invalid inputs:', { layerName, plotId });
                return;
            }

            console.log(`Attempting to highlight feature:`, {
                layerName,
                plotId,
                plotIdType: typeof plotId
            });
            
            // First try to get the source
            const source = map.getSource(layerName);
            if (!source) {
                console.warn(`Source not found: ${layerName}`);
                return;
            }

            // Get the source data directly
            const sourceData = source._data;
            if (!sourceData || !sourceData.features) {
                console.warn(`No features found in source: ${layerName}`);
                return;
            }

            // Log the first few features to check their structure
            console.log(`First 3 features in ${layerName}:`, 
                sourceData.features.slice(0, 3).map(f => ({
                    id: f.id,
                    properties: f.properties
                }))
            );

            // Find the feature with matching plot ID in properties
            const feature = sourceData.features.find(f => {
                const featureId = f.properties?.id;
                const plotIdMatch = String(featureId) === String(plotId);
                
                console.log('Comparing:', {
                    featureId,
                    plotId,
                    matches: plotIdMatch
                });
                
                return plotIdMatch;
            });

            if (feature) {
                console.log(`Found matching feature:`, feature);
                
                const featureId = feature.id || sourceData.features.indexOf(feature);
                
                // Set feature state for highlighting
                map.setFeatureState(
                    { source: layerName, id: featureId },
                    { highlighted: true }
                );
                highlightedFeatures.push({ source: layerName, id: featureId });

                // Calculate center point of the feature
                const bounds = new maplibregl.LngLatBounds();
                feature.geometry.coordinates[0].forEach(coord => {
                    bounds.extend(coord);
                });
                const center = bounds.getCenter();

                // Create marker element with GIF
                const markerEl = document.createElement('div');
                markerEl.className = 'pin-container';
                
                // Create image element
                const img = document.createElement('img');
                img.src = '{{ asset("images/locationpin.gif") }}';
                img.className = 'marker-pin';
                img.onload = () => console.log('GIF loaded:', img.src);
                img.onerror = (e) => console.error('GIF failed to load:', e);
                
                markerEl.appendChild(img);

                // Add marker to the map with an upward offset
                const marker = new maplibregl.Marker({
                    element: markerEl,
                    offset: [0, -20]
                })
                .setLngLat(center)
                .addTo(map);

                // Store marker reference for removal later
                highlightedFeatures[highlightedFeatures.length - 1].marker = marker;
            } else {
                console.warn('No feature found. Search details:', {
                    layerName,
                    plotId,
                    totalFeatures: sourceData.features.length,
                    availableIds: sourceData.features.map(f => f.properties?.id).slice(0, 10) // First 10 IDs
                });
            }
        } catch (error) {
            console.error('Error highlighting feature:', error);
            console.error('Error context:', {
                layerName,
                plotId,
                sourceExists: !!map.getSource(layerName),
                mapLoaded: map.loaded()
            });
        }
    }

    // Add these helper functions for popup creation
    function createLeveledPopup(plotHeader, recordsByLevel, center, targetLevel, targetId) {
        const levelButtonsHTML = Object.keys(recordsByLevel)
            .sort()
            .map(level => `
                <button class="level-btn ${level === targetLevel ? 'active' : ''}" data-level="${level}">
                    Level ${level}
                </button>
            `).join('');

        const recordsContainerHTML = Object.entries(recordsByLevel)
            .map(([level, records]) => {
                const isTargetLevel = level === targetLevel;
                return `
                    <div class="level-records" id="level-${level}-records" 
                         style="display: ${isTargetLevel ? 'block' : 'none'}">
                        <button class="back-button">← Back</button>
                        ${createCarousel(records, targetId)}
                    </div>
                `;
            }).join('');

        const popupContent = `
            <div class="popup-content">
                <h3 class="plot-header">${plotHeader}</h3>
                <hr class="header-divider">
                <div class="plot-details">
                    <div class="level-buttons" style="display: ${targetLevel ? 'none' : 'flex'}">
                        ${levelButtonsHTML}
                    </div>
                    <div class="records-container">
                        ${recordsContainerHTML}
                    </div>
                </div>
            </div>
        `;

        new maplibregl.Popup()
            .setLngLat(center)
            .setHTML(popupContent)
            .addTo(map);

        initializeCarousel(targetLevel ? `level-${targetLevel}-records` : null);
    }

    function createSimplePopup(plotHeader, deceased, center, targetId) {
        const popupContent = `
            <div class="popup-content">
                <h3 class="plot-header">${plotHeader}</h3>
                <hr class="header-divider">
                <div class="plot-details">
                    ${createCarousel(deceased, targetId)}
                </div>
            </div>
        `;

        new maplibregl.Popup()
            .setLngLat(center)
            .setHTML(popupContent)
            .addTo(map);

        initializeCarousel();
    }

    function createCarousel(records, targetId) {
        // Find the index of the target record
        const targetIndex = records.findIndex(r => String(r.id) === String(targetId));
        
        return `
            <div class="carousel">
                <div class="carousel__viewport">
                    ${records.map((person, index) => `
                        <div class="carousel__slide ${index === targetIndex ? 'active' : ''}" 
                             data-index="${index}">
                            <div class="deceased-details">
                                <h2>${formatValue(person.FirstName)} ${formatMiddleName(person.MiddleName)} ${formatValue(person.LastName)}</h2>
                                <h4><strong>Date of Birth:</strong> ${formatDate(person.DateOfBirth)}</h4>
                                <h4><strong>Date of Death:</strong> ${formatDate(person.DateOfDeath)}</h4>
                                <p>${index + 1} of ${records.length}</p>
                            </div>
                        </div>
                    `).join('')}
                </div>
                ${records.length > 1 ? `
                    <button class="carousel__prev">❮</button>
                    <button class="carousel__next">❯</button>
                ` : ''}
            </div>
        `;
    }

    function initializeCarousel(containerId = null) {
        const container = containerId ? 
            document.getElementById(containerId) : 
            document.querySelector('.popup-content');
            
        if (!container) return;

        const viewport = container.querySelector('.carousel__viewport');
        const slides = container.querySelectorAll('.carousel__slide');
        const activeSlide = container.querySelector('.carousel__slide.active');
        
        if (activeSlide) {
            viewport.scrollTo({
                left: activeSlide.offsetLeft,
                behavior: 'smooth'
            });
        }

        // Initialize carousel navigation
        if (slides.length > 1) {
            const prev = container.querySelector('.carousel__prev');
            const next = container.querySelector('.carousel__next');
            let currentSlide = Array.from(slides).findIndex(slide => slide.classList.contains('active'));
            if (currentSlide === -1) currentSlide = 0;

            function updateCarousel() {
                viewport.scrollTo({
                    left: slides[currentSlide].offsetLeft,
                    behavior: 'smooth'
                });
            }

            prev?.addEventListener('click', () => {
                currentSlide = (currentSlide - 1 + slides.length) % slides.length;
                updateCarousel();
            });

            next?.addEventListener('click', () => {
                currentSlide = (currentSlide + 1) % slides.length;
                updateCarousel();
            });
        }
    }

    // Update the reset view function
    function resetView() {
        // Clear search input
        const searchInput = document.getElementById('search-input');
        if (searchInput) {
            searchInput.value = '';
        }

        // Hide search results container
        const resultsContainer = document.getElementById('search-results');
        if (resultsContainer) {
            resultsContainer.style.display = 'none';
            resultsContainer.innerHTML = '';
        }

        // Clear all highlights and markers
        clearHighlightedFeatures();

        // Remove any existing popups
        if (currentPopup) {
            currentPopup.remove();
            currentPopup = null;
        }

        // Clear any selected feature state
        if (selectedFeatureId !== null && selectedFeatureSource !== null) {
            map.setFeatureState(
                { source: selectedFeatureSource, id: selectedFeatureId },
                { selected: false }
            );
            selectedFeatureId = null;
            selectedFeatureSource = null;
        }

        // Reset the map view to the cemetery map center
        map.flyTo({
            center: center,
            zoom: 17.9,
            bearing: 12,
            pitch: 0,
            duration: 1000
        });
    }

    // Make sure the reset button calls this function
    document.getElementById('reset-view').addEventListener('click', resetView);

    // Function to update plot colors based on availability
    function updatePlotColors() {
        const layers = ['apartment', 'lawnlots', 'boneniche', 'private']; // List of layers to update
        layers.forEach(layer => {
            const source = map.getSource(layer);
            if (source && source._data) {
                source._data.features.forEach(feature => {
                    const availability = feature.properties.availability; // Assuming availability is a property
                    let color;
                    if (availability === 'full') {
                        color = '#ff0000'; // Red for full
                    } else if (availability === 'vacant') {
                        color = '#00ff00'; // Green for vacant
                    } else if (availability === 'reserved') {
                        color = '#ffff00'; // Yellow for reserved
                    } else {
                        color = getColorForLayer(layer); // Default color
                    }
                    // Update the feature's color
                    map.setFeatureState(
                        { source: layer, id: feature.id },
                        { color: color }
                    );
                });
            }
        });
    }

    // Call the function to update plot colors when the map is loaded
    map.on('load', updatePlotColors);

</script>
@endsection
