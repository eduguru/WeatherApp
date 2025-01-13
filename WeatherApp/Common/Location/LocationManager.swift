//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Edwin Weru on 13/01/2025.
//

import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    //MARK: Object to Access Location Services
    private let locationManager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    //MARK: Continuation Object for the User Location
    private var continuation: CheckedContinuation<CLLocation, Error>?
    
    //MARK: Set up the Location Manager Delegate
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    // Requests the one-time delivery of the user’s current location
    func requestLocationOnce() {
        isLoading = true
        locationManager.requestLocation()
    }
    
    //
    func updateLocation() {
        locationManager.startUpdatingLocation() // start location update
        locationManager.distanceFilter = 100 // update location after 100 meter
        locationManager.allowsBackgroundLocationUpdates = true // update location in BG
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        //locationManager.startUpdatingLocation() // stop location update
        
        // locationManager.startMonitoringSignificantLocationChanges()
        //locationManager.stopMonitoringSignificantLocationChanges()
    }
    
    //MARK: Request Authorization to access the User Location
    func checkAuthorization() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            return
        }
    }
    
    //MARK: Async Request the Current Location
    var currentLocation: CLLocation {
        get async throws {
            return try await withCheckedThrowingContinuation { continuation in
                // 1. Set up the continuation object
                self.continuation = continuation
                // 2. Triggers the update of the current location
                locationManager.requestLocation()
            }
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            switch manager.authorizationStatus {
            case .denied: // Setting option: Never
                print("LocationManager didChangeAuthorization denied")
            case .notDetermined: // Setting option: Ask Next Time
                print("LocationManager didChangeAuthorization notDetermined")
            case .authorizedWhenInUse: // Setting option: While Using the App
                print("LocationManager didChangeAuthorization authorizedWhenInUse")
            case .authorizedAlways: // Setting option: Always
                print("LocationManager didChangeAuthorization authorizedAlways")
            case .restricted: // Restricted by parental control
                print("LocationManager didChangeAuthorization restricted")
            default:
                print("LocationManager didChangeAuthorization")
            }
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 4. If there is a location available
        location = locations.first?.coordinate
        isLoading = false
        
        if let lastLocation = locations.last {
            // 5. Resumes the continuation object with the user location as result
            continuation?.resume(returning: lastLocation)
            // Resets the continuation object
            continuation = nil
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // 6. If not possible to retrieve a location, resumes with an error
        continuation?.resume(throwing: error)
        continuation = nil // Resets the continuation object
        
        print("Error getting location", error)
        isLoading = false
    }
    
}
