import SwiftUI

struct MoonSection: View {
    var body: some View {
        Section {
            VStack {
                Image(systemName: "moonphase.waxing.gibbous")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("Moonrise: 23:32")
            }
        } header: {
            SectionHeaderText(icon: "moonphase.first.quarter", text: "Last Quarter")
        }
    }
}

#Preview {
    MoonSection()
}
