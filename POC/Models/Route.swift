//
//  RouteModel.swift
//  POC
//
//  Created by Dubon Ya'ar on 08/06/2024.
//

import SwiftUI
import MapKit
import SwiftData


@Model
class Route: Identifiable, Hashable {
   
    // Equatable
    public static func == (lhs: Route, rhs: Route) -> Bool {
        lhs.id == rhs.id
    }
    
    // Hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // Identifiable
    @Attribute(.unique)
    public private(set) var id: String
    
    // Props
    public let created: Date
    public private(set) var distance: Double
    public private(set) var updated: Date
    @Relationship(deleteRule:.cascade ) private(set) public  var snapshots: [RouteSnapshot]

   public init() {
        id = UUID().uuidString
        created = .init()
        updated = .init()
        snapshots = []
        distance = 0
    }
    
    public func append(location: CLLocation) {
        if let lastSnapshot = snapshots.last {
            let loc: CLLocation = .init(coordinate: .init(latitude: lastSnapshot.coords.latitude, longitude: lastSnapshot.coords.longitude), altitude: lastSnapshot.altitude, horizontalAccuracy: .infinity, verticalAccuracy: .infinity, timestamp: .now)
            distance += loc.distance(from: location)
        }
        
       
        self.snapshots.append(.init(coords: .init(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude), altitude: 0, speed: 0, timestamp: .now))
        
        updated = .now
    }
}
