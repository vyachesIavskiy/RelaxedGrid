import SwiftUI

struct HumiditySection: View {
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                Text(54, format: .percent)
                    .font(.largeTitle)
                    .fontDesign(.rounded)
                
                Spacer()
                
                Text("The dew point is \(Measurement.temperature(7), format: .temperature) right now.")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } header: {
            SectionHeaderText(icon: "humidity", text: "Humidity")
                .symbolVariant(.fill)
        }
    }
}

#Preview {
    HumiditySection()
}
