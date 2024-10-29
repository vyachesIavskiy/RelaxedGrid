import SwiftUI

// MARK: - Layout Value Keys
extension RelaxedGridLayout {
    struct GridSpanLayoutValueKey: LayoutValueKey {
        static let defaultValue = Grid.Span()
    }
}

// MARK: - Convenience setters
extension View {
    func relaxedGridSpan(_ gridSpan: RelaxedGridLayout.Grid.Span) -> some View {
        layoutValue(key: RelaxedGridLayout.GridSpanLayoutValueKey.self, value: gridSpan)
    }
}
