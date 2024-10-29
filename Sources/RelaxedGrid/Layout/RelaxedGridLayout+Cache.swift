import SwiftUI

extension RelaxedGridLayout {
    struct Cache {
        var numberOfItemsInRow = 0
        var layoutSize = CGSize.zero
        var itemSize = CGFloat(0)
        var spacing = CGFloat(0)
        var itemGridPositions = [Grid.Position]()
        var itemFrames = [CGRect]()
        
        mutating func invalidate() {
            self = Cache()
        }
    }
}
