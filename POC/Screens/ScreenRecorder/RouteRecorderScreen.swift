//
//  RouteRecorder.swift
//  POC
//
//  Created by Dubon Ya'ar on 22/06/2024.
//

import SwiftUI
import MapKit

struct RouteRecorderScreen: View {
    @State var model: RouteRecorderViewModel
    var body: some View {
        VStack {
            Text("Distance")
                .font(.callout)
            
            Text("\(model.route.distance / 1000, specifier: "%.2f")")
                .font(.custom("Helvetica", size: 30))
            + Text("Km")
                .font(.custom("Helvetica", size: 20))
           
        }
        .onAppear() {
            model.requestLocationAuthorization()
        }
        .onChange(of: model.locationManagerState) { _, newValue in
            switch newValue {
            case .authorizedAlways, .authorizedWhenInUse:
                model.startUpdatingLocation()
            
            default:break
            
            }
        }
    }
}

#Preview {
    RouteRecorderScreen(model: .init(route: .init()))
}
