import SwiftUI

struct HeaderView: View {
    var scrollOffset: CGFloat
    
    private let temperatureTransform = ScrollTransform(start: 120, finish: 170, identity: 1.0, transform: 0.0)
    private let summaryTransform = ScrollTransform(start: 200, finish: 220, identity: 0.0, transform: 1.0)
    private let conditionsTransform = ScrollTransform(start: 90, finish: 110, identity: 1.0, transform: 0.0)
    private let highLowTemperatureTransform = ScrollTransform(start: 30, finish: 80, identity: 1.0, transform: 0.0)
    
    var body: some View {
        VStack(spacing: 8) {
            VStack {
                Text("\(Image(systemName: "location")) HOME")
                    .symbolVariant(.fill)
                
                Text("Brno")
                    .font(.title)
                    .fontDesign(.rounded)
            }
            
            ZStack(alignment: .top) {
                Text(Measurement.temperature(21), format: .temperature)
                    .font(.system(size: 100))
                    .fontWeight(.thin)
                    .opacity(temperatureTransform.opacity(for: scrollOffset))
                
                Text("\(Measurement.temperature(21), format: .temperature) | Mostly Clear")
                    .foregroundStyle(.secondary)
                    .opacity(summaryTransform.opacity(for: scrollOffset))
            }
            
            VStack {
                Text("Mostly Clear")
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                    .opacity(conditionsTransform.opacity(for: scrollOffset))
                
                HStack {
                    Text("H:\(Measurement.temperature(27), format: .temperature)")
                    Text("L:\(Measurement.temperature(11), format: .temperature)")
                }
                .fontWeight(.medium)
                .opacity(highLowTemperatureTransform.opacity(for: scrollOffset))
            }
        }
        .offset(y: -min(scrollOffset, 150) * 0.1)
        .frame(height: 400)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    @Previewable @State
    var scrollOffset = CGFloat(0)
    
    ZStack {
        ScrollView {
            LinearGradient(colors: [.white, .gray.opacity(0.2)], startPoint: .top, endPoint: .bottom)
                .frame(height: 3000)
        }
        .onScrollGeometryChange(for: CGFloat.self, of: \.contentOffset.y) { _, newValue in
            scrollOffset = newValue
        }
        
        HeaderView(scrollOffset: scrollOffset)
    }
}

private struct ScrollTransform {
    let start: CGFloat
    let finish: CGFloat
    var identity: CGFloat
    var transform: CGFloat
    
    func opacity(for offset: CGFloat) -> CGFloat {
        let length = finish - start
        
        guard length > 0 else { return identity }
        
        let progress = offset - start
        
        guard progress > 0 else { return identity }
        guard progress < length else { return transform }
        
        let progressMultiplier = progress / length
        return if transform > identity {
            progressMultiplier
        } else {
            1 - progressMultiplier
        }
    }
}
