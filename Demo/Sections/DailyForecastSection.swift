import SwiftUI
import Charts

struct DailyForecastSection: View {
    private let data = DailyForecast.demoData
    
    var body: some View {
        Section {
            GeometryReader { g in
                List(data) { dailyForecast in
                    HStack(spacing: 20) {
                        dailyForecast.dayText
                            .frame(minWidth: 70, alignment: .leading)
                        
                        VStack(spacing: 2) {
                            dailyForecast.conditionsImage
                                .symbolVariant(.fill)
                                .symbolRenderingMode(.multicolor)
                                .font(.title3)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                            
                            if let percentageText = dailyForecast.percentageText {
                                percentageText
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.cyan)
                            }
                        }
                        .frame(minWidth: 50)
                        
                        dailyForecast.minTemperatureText
                            .fontWeight(.medium)
                            .foregroundStyle(.secondary)
                        
                        Chart {
                            RuleMark(
                                xStart: .value("", dailyForecast.minTemperature),
                                xEnd: .value("", dailyForecast.maxTemperature)
                            )
                            .lineStyle(StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                        }
                        .chartXAxis(.hidden)
                        .chartXScale(domain: (data.minTemperature ?? 0)...(data.maxTemperature ?? 1))
                        .chartScrollableAxes([])
                        .frame(height: g.size.height / 10)
                        
                        dailyForecast.maxTemperatureText
                            .fontWeight(.medium)
                    }
                    .font(.title2)
                    .listRowBackground(Color.clear)
                    .listSectionSeparator(.hidden, edges: .bottom)
                    .listRowInsets(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                }
                .listStyle(.plain)
                .scrollDisabled(true)
                .environment(\.defaultMinListRowHeight, g.size.height / 10)
            }
        } header: {
            SectionHeaderText(icon: "calendar", text: "10-Day Forecast")
        }
    }
}

private struct DailyForecast: Identifiable {
    let id = UUID()
    let day: String
    let conditions: Conditions
    let minTemperature: Double
    let maxTemperature: Double
    
    var dayText: Text {
        Text(day)
    }
    
    var conditionsImage: Image {
        let imageName = switch conditions {
        case .clear: "sun.max"
        case .cloudy: "cloud"
        case .rain: "cloud.rain"
        case .wind: "wind"
        }
        
        return Image(systemName: imageName)
    }
    
    var percentageText: Text? {
        switch conditions {
        case .clear: nil
        case .cloudy: nil
        case let .rain(percentage): Text(percentage, format: .percent)
        case .wind: nil
        }
    }
    
    var minTemperatureText: Text {
        Text(Measurement.temperature(minTemperature), format: .temperature)
    }
    
    var maxTemperatureText: Text {
        Text(Measurement.temperature(maxTemperature), format: .temperature)
    }
}

extension DailyForecast {
    enum Conditions {
        case clear
        case cloudy
        case rain(percentage: Int)
        case wind
    }
}

extension DailyForecast {
    static let demoData = [
        DailyForecast(day: "Today", conditions: .clear, minTemperature: 11, maxTemperature: 27),
        DailyForecast(day: "Mon", conditions: .clear, minTemperature: 12, maxTemperature: 26),
        DailyForecast(day: "Tue", conditions: .clear, minTemperature: 14, maxTemperature: 26),
        DailyForecast(day: "Wed", conditions: .cloudy, minTemperature: 16, maxTemperature: 24),
        DailyForecast(day: "Thu", conditions: .cloudy, minTemperature: 16, maxTemperature: 23),
        DailyForecast(day: "Fri", conditions: .cloudy, minTemperature: 15, maxTemperature: 21),
        DailyForecast(day: "Sat", conditions: .rain(percentage: 15), minTemperature: 14, maxTemperature: 18),
        DailyForecast(day: "Sun", conditions: .rain(percentage: 60), minTemperature: 13, maxTemperature: 17),
        DailyForecast(day: "Mon", conditions: .rain(percentage: 25), minTemperature: 12, maxTemperature: 19),
        DailyForecast(day: "Tue", conditions: .wind, minTemperature: 14, maxTemperature: 20)
    ]
}

extension [DailyForecast] {
    var minTemperature: Double? {
        map(\.minTemperature).min()
    }
    
    var maxTemperature: Double? {
        map(\.maxTemperature).max()
    }
}

#Preview {
    DailyForecastSection()
}
