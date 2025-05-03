@extends('layouts.app')

@section('styles')
<link href='https://unpkg.com/maplibre-gl@3.6.2/dist/maplibre-gl.css' rel='stylesheet' />
<link href="{{ asset('css/map.css') }}" rel="stylesheet" />
@endsection

@section('content')
<div id="map"></div>
@endsection

@section('scripts')
<script src='https://unpkg.com/maplibre-gl@3.6.2/dist/maplibre-gl.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.9.0/proj4.js"></script>
<script>
    // Get the grave type from URL parameters
    const urlParams = new URLSearchParams(window.location.search);
    const selectedGraveType = urlParams.get('type');

    // Function to get the numeric type based on the URL parameter
    function getNumericType(typeString) {
    switch(typeString.toLowerCase()) {
        case 'apartment':
            return 1;
        case 'lawnlots':
            return 2;
        case 'boneniche':
            return 3;
        case 'private':
            return 4;
        default:
            return null;
    }
}

    // Store the numeric type
    const selectedNumericType = getNumericType(selectedGraveType);

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
        zoom: 17.9,
        bearing: 12,
        maxZoom: 24,
        minZoom: 17.9
    });

    // Function to convert type values - handle both string and number types
    function getPlotType(typeValue) {
    // Convert to string for consistent comparison
    const type = String(typeValue);
    
    switch (type) {
        case '1':
        case 1:
            return 'Apartment';
        case '2':
        case 2:
            return 'Family Lawn Lot';
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

    // Function to determine color for each layer
    function getColorForLayer(name) {
    switch(name) {
        case 'apartment': return '#4daf4a';  // Green for Apartment
        case 'lawnlots': return '#377eb8';   // Blue for Family Lawn Lot
        case 'boneniche': return '#984ea3';  // Purple for Bone Niche
        case 'private': return '#e41a1c';    // Red for Private
        default: return '#999999';           // Gray for unknown
    }
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
        const geojsonFiles = ['apartment', 'lawnlots', 'boneniche', 'private'];        let selectedFeatureId = null;
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

                    map.addSource(file, {
                        type: 'geojson',
                        data: data
                    });

                    // Add the main layer with type-based styling
                    map.addLayer({
                        'id': `${file}-layer`,
                        'type': 'fill',
                        'source': file,
                        'paint': {
                            'fill-color': [
                                'case',
                                ['boolean', ['feature-state', 'selected'], false],
                                '#ffff00', // Color when selected (red)
                                ['boolean', ['feature-state', 'hover'], false],
                                '#ffff00', // Color when hovered (yellow)
                                ['==', ['get', 'type'], selectedNumericType],
                                getColorForLayer(file), // Default color for selectable plots
                                '#808080' // Gray color for non-selectable plots
                            ],
                            'fill-opacity': [
                                'case',
                                ['boolean', ['feature-state', 'selected'], false],
                                1, // Full opacity when selected
                                ['boolean', ['feature-state', 'hover'], false],
                                1, // Full opacity when hovered
                                ['==', ['get', 'type'], selectedNumericType],
                                0.8, // Normal opacity for selectable plots
                                0.3  // Reduced opacity for non-selectable plots
                            ],
                            'fill-outline-color': '#ffffff' // White border color
                        }
                    });

                    // Add a layer for plot numbers
                    map.addLayer({
                        'id': `${file}-labels`,
                        'type': 'symbol',
                        'source': file,
                        'layout': {
                            'text-field': ['get', 'plot'], // Use the 'plot' field for the plot number
                            'text-font': ['Open Sans Regular', 'Arial Unicode MS Regular'],
                            'text-size': [
                                'interpolate', // Use interpolation to adjust text size based on zoom level
                                ['linear'],
                                ['zoom'], // The zoom level
                                17, 7,   // At zoom level 17, text size is 4
                                24, 25    // At zoom level 20, text size is 25
                            ],
                            'text-offset': [0, 0], // Center the text in the middle of the box
                            'text-anchor': 'center' // Anchor the text to the center
                        },
                        'paint': {
                            'text-color': '#000000', // Color of the plot number text
                            'text-opacity': [
                                'interpolate', // Use interpolation to adjust text opacity based on zoom level
                                ['linear'],
                                ['zoom'], // The zoom level
                                17, 0,    // At zoom level 17, text is invisible
                                20, 1      // At zoom level 20 and above, text is fully visible
                            ]
                        }
                    });

                    let hoveredFeatureId = null;

                    // Handle mousemove events for hover state
                    map.on('mousemove', `${file}-layer`, (e) => {
                        if (e.features.length > 0) {
                            const feature = e.features[0];
                            const featureType = parseInt(feature.properties.type);

                            // Check if the feature type matches the selected grave type
                            if (featureType === selectedNumericType) {
                                map.getCanvas().style.cursor = 'pointer';

                                // Set hover state for the feature
                                map.setFeatureState(
                                    { source: file, id: feature.id },
                                    { hover: true }
                                );

                                // Update hoveredFeatureId
                                if (hoveredFeatureId !== feature.id) {
                                    // Reset hover state for the previously hovered feature
                                    if (hoveredFeatureId !== null) {
                                        map.setFeatureState(
                                            { source: file, id: hoveredFeatureId },
                                            { hover: false }
                                        );
                                    }
                                    hoveredFeatureId = feature.id; // Update to the new hovered feature
                                }
                            } else {
                                map.getCanvas().style.cursor = 'not-allowed'; // Change cursor if not selectable
                            }
                        }
                    });

                    // Handle mouseleave events to reset hover state
                    map.on('mouseleave', `${file}-layer`, () => {
                        map.getCanvas().style.cursor = '';
                        if (hoveredFeatureId !== null) {
                            map.setFeatureState(
                                { source: file, id: hoveredFeatureId },
                                { hover: false } // Reset hover state
                            );
                        }
                        hoveredFeatureId = null; // Reset hovered feature ID
                    });

                    // Click event for selection with type checking
                    map.on('click', `${file}-layer`, (e) => {
                        if (e.features.length > 0) {
                            const clickedFeature = e.features[0];
                            const props = clickedFeature.properties;
                            const featureType = parseInt(props.type);

                            if (featureType === selectedNumericType) {
                                // Clear previous selection
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

                                // Prepare plot data for VB.NET
                                const plotData = {
                                    id: parseInt(props.id),
                                    type: featureType,
                                    block: props.block,
                                    section: props.section,
                                    row: props.row,
                                    plot: props.plot,
                                    level: props.level || 0
                                };

                                // Send to VB.NET
                                if (window.chrome && window.chrome.webview) {
                                    window.chrome.webview.postMessage(JSON.stringify(plotData));
                                }

                                // Zoom to feature
                                const coordinates = clickedFeature.geometry.coordinates[0];
                                const bounds = coordinates.reduce((bounds, coord) => {
                                    return bounds.extend(coord);
                                }, new maplibregl.LngLatBounds(coordinates[0], coordinates[0]));

                                map.fitBounds(bounds, {
                                    padding: 50,
                                    maxZoom: 21.7,
                                    duration: 1000,
                                    bearing: 12,
                                    pitch: 0
                                });

                                // Show popup
                                const plotType = getPlotType(props.type);
                                const plotHeader = `${plotType}, Block ${formatValue(props.block)}, Section ${formatValue(props.section)}, Row ${formatValue(props.row)}, Plot ${formatValue(props.plot)}`;
                                
                                let popupContent = `
                                    <div class="popup-content">
                                        <h3 class="plot-header">${plotHeader}</h3>
                                        <div class="plot-details">
                                            <p><strong>ID:</strong> ${formatValue(props.id)}</p>
                                        </div>
                                    </div>
                                `;

                                new maplibregl.Popup()
                                    .setLngLat(e.lngLat)
                                    .setHTML(popupContent)
                                    .addTo(map);
                            } else {
                                // Show message for non-matching plot type
                                new maplibregl.Popup()
                                    .setLngLat(e.lngLat)
                                    .setHTML(`<div class="popup-content">
                                        <p>This plot is not available for the selected grave type.</p>
                                    </div>`)
                                    .addTo(map);
                            }
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

        // Define the initial bounds
        const initialBounds = new maplibregl.LngLatBounds(sw, ne);

        // Reset view control
        class ResetViewControl {
            onAdd(map) {
                this.map = map;
                this.container = document.createElement('div');
                this.container.className = 'maplibregl-ctrl maplibregl-ctrl-group';
                
                const button = document.createElement('button');
                button.className = 'maplibregl-ctrl-icon';
                button.type = 'button';
                button.title = 'Reset View';
                button.innerHTML = '🔄';
                button.onclick = () => {
                    // Remove popups
                    const popups = document.getElementsByClassName('maplibregl-popup');
                    while(popups[0]) {
                        popups[0].remove();
                    }

                    // Clear selection
                    if (selectedFeatureId !== null && selectedFeatureSource !== null) {
                        map.setFeatureState(
                            { source: selectedFeatureSource, id: selectedFeatureId },
                            { selected: false }
                        );
                        selectedFeatureId = null;
                        selectedFeatureSource = null;
                    }

                    // Reset view
                    map.fitBounds(initialBounds, {
                        padding: 50,
                        duration: 1000,
                        bearing: 12,
                        pitch: 0
                    });
                };

                this.container.appendChild(button);
                return this.container;
            }

            onRemove() {
                this.container.parentNode.removeChild(this.container);
                this.map = undefined;
            }
        }

        // Add reset control
        map.addControl(new ResetViewControl(), 'top-left');
    });

    map.on('error', (e) => {
        console.error('Map error:', e);
    });
</script>
@endsection