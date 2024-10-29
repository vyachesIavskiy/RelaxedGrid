
// MARK: - Grid
extension RelaxedGridLayout {
    struct Grid {
        var position: Position
        var span: Span
    }
}

extension RelaxedGridLayout.Grid {
    // MARK: - Position
    struct Position {
        var x: Int
        var y: Int
        
        init(x: Int, y: Int) {
            self.x = max(x, 0)
            self.y = max(y, 0)
        }
    }

    // MARK: - Span
    struct Span {
        var horizontal = 2
        var vertical = 1
        
        init(horizontal: Int = 2, vertical: Int = 1) {
            self.horizontal = max(1, horizontal)
            self.vertical = max(1, vertical)
        }
    }
}
