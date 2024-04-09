//
//  WeatherMapView.swift
//  weather_app
//
//  Created by Jahnavi Vemuri on 18/01/24.
//

import Foundation
import SwiftUI
import MapKit

struct WeatherMapView: View {
    let latitude: Double
    let longitude: Double

    var body: some View {
        Map(coordinateRegion: .constant(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
            )
        ))
        .cornerRadius(10)
    }
}
