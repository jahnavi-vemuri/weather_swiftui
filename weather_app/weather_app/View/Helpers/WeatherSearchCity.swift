//
//  WeatherSearchCity.swift
//  weather_app
//
//  Created by Jahnavi Vemuri on 18/01/24.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onCommit: () -> Void
    
    var body: some View {
        HStack {
            TextField("Enter the city name", text: $text, onCommit: {
                onCommit()
            })
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 15)
        }
        .padding(.top, 8)
    }
}
