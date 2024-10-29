import SwiftUI
import Charts

struct SunPhaseSection: View {
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                Text("22:04")
                    .font(.largeTitle)
                    .fontDesign(.rounded)
                    .padding(.horizontal, 12)
                
                Chart {
                    LineMark(x: .value("time", -1), y: .value("altitude", 1))
                        .interpolationMethod(.cardinal)
                        .lineStyle(StrokeStyle(lineWidth: 4))
                    
                    LineMark(x: .value("time", 0), y: .value("altitude", -1))
                    
                    LineMark(x: .value("time", 1), y: .value("altitude", 1))
                    
                    LineMark(x: .value("time", 2), y: .value("altitude", -1))
                    
                    LineMark(x: .value("time", 3), y: .value("altitude", 1))
                    
                    RuleMark(y: .value("altitude", 0))
                        .foregroundStyle(.primary)
                }
                .foregroundStyle(.tertiary)
                .chartXScale(domain: 0...2)
                .chartYScale(domain: -1.25...1.25)
                .chartXAxis(.hidden)
                .chartYAxis(.hidden)
                .chartLegend(.hidden)
                
                Text("Sunset: 22:04")
                    .padding(.horizontal, 12)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } header: {
            SectionHeaderText(icon: "sunset", text: "Sunset")
                .symbolVariant(.fill)
        }
    }
}

#Preview {
    SunPhaseSection()
}
