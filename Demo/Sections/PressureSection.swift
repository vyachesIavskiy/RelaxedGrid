import SwiftUI

struct PressureSection: View {
    var body: some View {
        Section {
            VStack {
                Circle()
                    .trim(from: 0, to: 0.7)
                    .stroke(style: StrokeStyle(lineWidth: 8, dash: [2, 4]))
                    .rotationEffect(.degrees(145))
                    .padding(4)
                    .overlay {
                        VStack(spacing: 0) {
                            Text("=")
                                .font(.title3)
                                .fontWeight(.medium)
                                .fontDesign(.rounded)
                            
                            Text("1,029")
                                .font(.title3)
                                .fontWeight(.medium)
                                .fontDesign(.rounded)
                            
                            Text("mbar")
                        }
                    }
                    .padding(.bottom, -25)
                
                HStack {
                    Text("Low")
                        .frame(maxWidth: .infinity)
                    
                    Text("High")
                        .frame(maxWidth: .infinity)
                }
            }
        } header: {
            SectionHeaderText(icon: "gauge.with.dots.needle.bottom.50percent", text: "Pressure")
        }
    }
}

#Preview {
    PressureSection()
        .frame(width: 128, height: 128)
}
