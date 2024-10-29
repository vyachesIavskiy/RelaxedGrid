import SwiftUI
import Charts

struct UVIndexSection: View {
    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 0) {
                Text(0, format: .number)
                    .font(.largeTitle)
                    .fontDesign(.rounded)
                
                Text("Low")
                    .font(.title)
                    .fontDesign(.rounded)
                
                Spacer()
                
                Chart {
                    RuleMark(xStart: .value("", 0), xEnd: .value("", 1))
                        .lineStyle(StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                        .foregroundStyle(.linearGradient(
                            colors: [.green, .yellow, .orange, .pink, .purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                }
                .chartXAxis(.hidden)
                .chartScrollableAxes([])
                .frame(height: 4)
                
                Spacer()
                
                Text("Low for the rest of the day")
                    .lineLimit(2, reservesSpace: true)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } header: {
            SectionHeaderText(icon: "sun.max", text: "UV Index")
                .symbolVariant(.fill)
        }
    }
}

#Preview {
    UVIndexSection()
}
