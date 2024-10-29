import SwiftUI

struct VisibilitySection: View {
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                Text("26 km")
                    .font(.largeTitle)
                    .fontDesign(.rounded)
                
                Spacer()
                
                Text("Perfectly clear view.")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } header: {
            SectionHeaderText(icon: "eye", text: "Visibility")
                .symbolVariant(.fill)
        }
    }
}

#Preview {
    VisibilitySection()
}
