//
//  CLLocation+E.swift
//  POC
//
//  Created by Dubon Ya'ar on 22/06/2024.
//

import CoreLocation

extension CLLocationCoordinate2D: @retroactive Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude || lhs.longitude == rhs.longitude
    }
}
