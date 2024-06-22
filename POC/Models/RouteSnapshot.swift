//
//  RouteSnapshot.swift
//  POC
//
//  Created by Dubon Ya'ar on 10/06/2024.
//

import Foundation
import SwiftData
import MapKit

@Model
public class RouteSnapshot {
    let speed: Double
    let altitude: Double
    @Relationship(deleteRule:.cascade )  let timestamp: Date
    @Relationship(deleteRule:.cascade ) let coords: RouteSnapshot2dCoords
    
    init(coords: RouteSnapshot2dCoords, altitude: Double,speed: Double, timestamp: Date) {
        self.coords = coords
        self.altitude = altitude
        self.speed = speed
       self.timestamp = timestamp
    }
}

