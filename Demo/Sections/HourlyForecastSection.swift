import SwiftUI

struct HourlyForecastSection: View {
    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(HourlyForecast.demoData) { hourlyForecast in
                        VStack(spacing: 20) {
                            hourlyForecast.timeText
                                .font(.callout)
                                .fontWeight(.medium)
                            
                            hourlyForecast.conditionsImage
                                .symbolVariant(.fill)
                                .symbolRenderingMode(.multicolor)
                                .font(.title3)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .frame(minHeight: 30)
                            
                            hourlyForecast.temperatureText
                                .font(.title3)
                                .fontWeight(.medium)
                        }
                    }
                }
                .padding(.horizontal, 12)
            }
            .scrollBounceBehavior(.basedOnSize)
        } header: {
            SectionHeaderText(icon: "clock", text: "Hourly Forecast")
        }
    }
}

private struct HourlyForecast: Identifiable {
    let id = UUID()
    let time: String
    let conditions: Conditions
    let temperature: String
    
    var timeText: Text {
        Text(time)
    }
    
    var conditionsImage: Image {
        let name = switch conditions {
        case .clearDay: "sun.max"
        case .clearNight: "moon.stars"
        case .partlyCloudyDay: "cloud.sun"
        case .partlyCloudyNight: "cloud.moon"
        case .cloudy: "cloud"
        case .rain: "cloud.rain"
        case .thunder: "cloud.bolt.rain"
        case .wind: "wind"
        case .sunset: "sunrise"
        case .sunrise: "sunset"
        }
        
        return Image(systemName: name)
    }
    
    var temperatureText: Text {
        if let temperature = Double(temperature) {
            Text(Measurement.temperature(temperature), format: .temperature)
        } else {
            Text(temperature)
        }
    }
}

extension HourlyForecast {
    enum Conditions {
        case clearDay
        case clearNight
        case partlyCloudyDay
        case partlyCloudyNight
        case cloudy
        case rain
        case thunder
        case wind
        case sunset
        case sunrise
    }
}

extension HourlyForecast {
    static let demoData = [
        HourlyForecast(time: "Now", conditions: .clearDay, temperature: "21"),
        HourlyForecast(time: "10", conditions: .clearDay, temperature: "22"),
        HourlyForecast(time: "11", conditions: .clearDay, temperature: "24"),
        HourlyForecast(time: "12", conditions: .clearDay, temperature: "27"),
        HourlyForecast(time: "13", conditions: .partlyCloudyDay, temperature: "25"),
        HourlyForecast(time: "14", conditions: .partlyCloudyDay, temperature: "24"),
        HourlyForecast(time: "15", conditions: .cloudy, temperature: "23"),
        HourlyForecast(time: "16", conditions: .cloudy, temperature: "23"),
        HourlyForecast(time: "17", conditions: .rain, temperature: "19"),
        HourlyForecast(time: "18", conditions: .rain, temperature: "18"),
        HourlyForecast(time: "19", conditions: .thunder, temperature: "18"),
        HourlyForecast(time: "20", conditions: .thunder, temperature: "17"),
        HourlyForecast(time: "21", conditions: .wind, temperature: "15"),
        HourlyForecast(time: "22", conditions: .wind, temperature: "14"),
        HourlyForecast(time: "22:04", conditions: .sunset, temperature: "Sunset"),
        HourlyForecast(time: "23", conditions: .wind, temperature: "12"),
        HourlyForecast(time: "00", conditions: .cloudy, temperature: "11"),
        HourlyForecast(time: "01", conditions: .cloudy, temperature: "12"),
        HourlyForecast(time: "02", conditions: .partlyCloudyNight, temperature: "13"),
        HourlyForecast(time: "03", conditions: .partlyCloudyNight, temperature: "13"),
        HourlyForecast(time: "04", conditions: .clearNight, temperature: "14"),
        HourlyForecast(time: "05", conditions: .clearNight, temperature: "14"),
        HourlyForecast(time: "06", conditions: .clearNight, temperature: "16"),
        HourlyForecast(time: "06:28", conditions: .sunrise, temperature: "Sunrise"),
        HourlyForecast(time: "07", conditions: .clearDay, temperature: "18"),
        HourlyForecast(time: "08", conditions: .clearDay, temperature: "19"),
    ]
}

#Preview {
    HourlyForecastSection()
}
