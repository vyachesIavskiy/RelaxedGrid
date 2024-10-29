import SwiftUI

extension RelaxedGridLayout {
    // MARK: - Spacing
    enum Spacing {
        static let compact = CGFloat(12)
        static let regular = CGFloat(16)
    }
    
    // MARK: - ItemSize
    enum ItemSize {
        static let ideal = CGFloat(200)
        static let max = CGFloat(250)
    }
    
    // MARK: - NumerOfItemsInRow
    enum NumberOfItemsInRow {
        static let min = 2
        static let max = 6
    }
}
