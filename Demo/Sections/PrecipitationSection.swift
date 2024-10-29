import SwiftUI

struct PrecipitationSection: View {
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("0 mm")
                        .font(.largeTitle)
                        .fontDesign(.rounded)
                    
                    Text("Today")
                        .font(.title2)
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                }
                
                Spacer()
                
                Text("Next expected is 4 mm in 2 days")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } header: {
            SectionHeaderText(icon: "drop", text: "Precipitation")
                .symbolVariant(.fill)
        }
    }
}

#Preview {
    PrecipitationSection()
}
