import SwiftUI

struct WindSection: View {
    var body: some View {
        Section {
            VStack {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 8, dash: [1, 1]))
                    .overlay {
                        VStack(spacing: 0) {
                            Text("4")
                                .fontWeight(.medium)
                            
                            Text("mph")
                        }
                    }
                    .padding(4)
                
                Text("Guts: 4 mph ESE")
            }
        } header: {
            SectionHeaderText(icon: "wind", text: "Wind")
        }
    }
}

#Preview {
    WindSection()
        .frame(width: 128, height: 128)
}
