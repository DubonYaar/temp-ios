//
//  RouteSnapshot2dCoords.swift
//  POC
//
//  Created by Dubon Ya'ar on 10/06/2024.
//

import Foundation
import SwiftData

@Model
public class RouteSnapshot2dCoords {
    let latitude: Double
    let longitude: Double
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
