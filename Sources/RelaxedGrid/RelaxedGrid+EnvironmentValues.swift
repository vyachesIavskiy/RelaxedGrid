import SwiftUI

// MARK: - Environment Value Entries
extension EnvironmentValues {
    @Entry var relaxedGridEdgeInsets = EdgeInsets(top: 16, leading: 12, bottom: 16, trailing: 12)
}

// MARK: - Convenience Setters
extension View {
    public func relaxedGridEdgeInsets(_ insets: EdgeInsets) -> some View {
        environment(\.relaxedGridEdgeInsets, insets)
    }
}
