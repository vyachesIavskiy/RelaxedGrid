import SwiftUI

struct GradientBackground: View {
    var body: some View {
        LinearGradient(
            colors: [.blue.opacity(0.25), .blue.opacity(0.2), .cyan.opacity(0.15), .yellow.opacity(0.15), .orange.opacity(0.2), .orange.opacity(0.25)],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

#Preview {
    GradientBackground()
}
