//
//  RouteRecorderViewModel.swift
//  POC
//
//  Created by Dubon Ya'ar on 22/06/2024.
//

import Foundation
import CoreLocation
import CoreMotion
@Observable
class RouteRecorderViewModel: NSObject {
    
    // Published
    private(set) var route: Route
    private(set) var locationManagerState: CLAuthorizationStatus = .notDetermined
   
    @ObservationIgnored
    private var locationManager: CLLocationManager

    @ObservationIgnored
    private let activityManager = CMMotionActivityManager()
   
    @ObservationIgnored
    private let pedometer: CMPedometer = .init()
    
    override private init(){
        fatalError("Not allowed, use init(route: Route)")
    }
    
    init(route: Route) {
        
        self.route = route
        locationManager = .init()
      
        super.init()
        
        locationManager.delegate = self
        
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }


    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }


    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }
}


extension RouteRecorderViewModel:  CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        locations.forEach {
            route.append(location: $0)
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationManagerState = manager.authorizationStatus
    }
}
