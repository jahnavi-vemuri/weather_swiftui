//
//  WeatherBottomSheetView.swift
//  weather_app
//
//  Created by Jahnavi Vemuri on 18/01/24.
//

import Foundation
import SwiftUI

struct BottomSheetContent: View {
    let latitude: Double
    let longitude: Double
    let windSpeed: Double
    let pressure: Double
    let sheetHeight: CGFloat
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            HStack {
                Image(systemName: "location")
                    .foregroundColor(.blue)
                Text("Lat: \(String(format: "%.2f", latitude))")
                    .foregroundColor(.black)
                Text(", Long: \(String(format: "%.2f", longitude))")
                    .foregroundColor(.black)
            }
            HStack {
                Image(systemName: "wind")
                    .foregroundColor(.blue)
                Text("Wind Speed: \(String(format: "%.1f", windSpeed)) m/s")
                    .foregroundColor(.black)
            }
            
            HStack {
                Image(systemName: "gauge")
                    .foregroundColor(.blue)
                Text("Pressure: \(String(format: "%.1f", pressure)) hPa")
                    .foregroundColor(.black)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: sheetHeight) // Set custom height
        .background(Color(UIColor.white))
        .edgesIgnoringSafeArea(.bottom)
    }
}
