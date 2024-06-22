//
//  POCApp.swift
//  POC
//
//  Created by Dubon Ya'ar on 22/06/2024.
//

import SwiftUI
import SwiftData
@main
struct POCApp: App {
    var body: some Scene {
        WindowGroup {
            RouteRecorderScreen(model: .init(route: .init()))
        }
        .modelContainer(for: [Route.self, RouteSnapshot2dCoords.self, RouteSnapshot.self])
    }
}
