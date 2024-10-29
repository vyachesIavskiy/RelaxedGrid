import SwiftUI

struct FeelsLikeSection: View {
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                Text(Measurement.temperature(13), format: .temperature)
                    .font(.largeTitle)
                    .fontDesign(.rounded)
                
                Spacer()
                
                Text("Wind is making it feel cooler.")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } header: {
            SectionHeaderText(icon: "thermometer.medium", text: "Feels like")
        }
    }
}

#Preview {
    FeelsLikeSection()
}
