import SwiftUI

struct WeatherSearchView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    Text("Weather App")
                        .font(.system(size: 45))
                    SearchBar(text: $viewModel.searchText, onCommit: {
                        viewModel.fetchWeatherData()
                    })
                    Spacer().frame(height: 30)
                    if let weatherData = viewModel.weatherData {
                        WeatherDetails(weatherData: weatherData, isWeatherDetailsPresented: $viewModel.isWeatherDetailsPresented)
                    } else {
                        ProgressView("Loading...")
                            .foregroundColor(.gray)
                            .italic()
                            .padding()
                            .onAppear {
                                viewModel.fetchWeatherData()
                            }
                    }
                }
                .padding()
            }
            .navigationTitle("")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherSearchView()
    }
}
