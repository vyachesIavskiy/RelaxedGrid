import SwiftUI

struct AveragesSection: View {
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                Text("+\(Measurement.temperature(3), format: .temperature)")
                    .font(.largeTitle)
                    .fontDesign(.rounded)
                
                Text("above average daily high")
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                
                HStack {
                    Text("Today")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Text("H:\(Measurement.temperature(22), format: .temperature)")
                        .fontWeight(.medium)
                }
                
                HStack {
                    Text("Average")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Text("H:\(Measurement.temperature(26), format: .temperature)")
                        .fontWeight(.medium)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } header: {
            SectionHeaderText(icon: "chart.line.uptrend.xyaxis", text: "Averages")
        }
    }
}

#Preview {
    AveragesSection()
}
