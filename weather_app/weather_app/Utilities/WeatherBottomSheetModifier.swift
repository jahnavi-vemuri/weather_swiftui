//
//  WeatherBottomSheetModifier.swift
//  weather_app
//
//  Created by Jahnavi Vemuri on 18/01/24.
//

import Foundation
import SwiftUI

extension View {
    func bottomSheet<Content: View>(isPresented: Binding<Bool>, sheetHeight: CGFloat = UIScreen.main.bounds.height / 4, @ViewBuilder content: @escaping () -> Content) -> some View {
        ZStack {
            self

            if isPresented.wrappedValue {
                VStack {
                    Spacer() // Push content to the top
                    content()
                        .frame(maxWidth: .infinity)
                        .frame(height: sheetHeight)
                        .background(Color(UIColor.white))
                        .edgesIgnoringSafeArea(.bottom)
                }
                .transition(.move(edge: .bottom))
                .animation(.easeInOut)
            }
        }
    }
}
