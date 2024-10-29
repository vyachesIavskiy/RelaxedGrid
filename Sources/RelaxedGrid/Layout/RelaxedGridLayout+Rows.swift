import SwiftUI

// MARK: - Rows
extension RelaxedGridLayout {
    struct Rows {
        // MARK: Typealiases
        typealias Position = RelaxedGridLayout.Grid.Position
        typealias Span = RelaxedGridLayout.Grid.Span
        
        // MARK: Properties
        private var numberOfItemsInRow: Int
        private var rows: [Row]
        
        var count: Int {
            rows.count
        }
        
        // MARK: Init
        init(numberOfItemsInRow: Int) {
            self.numberOfItemsInRow = numberOfItemsInRow
            self.rows = []
        }
        
        // MARK: Funcs
        mutating func addSpan(_ span: Span) -> Position {
            for (index, row) in rows.enumerated() {
                for columnIndex in row.availableIndicies(for: span) {
                    if span.vertical == 1 {
                        rows[index].add(span: span, at: columnIndex)
                        return Position(x: columnIndex, y: index)
                    } else {
                        let nextIndicies = index + 1..<index + span.vertical
                        var canAdd = true
                        for nextIndex in nextIndicies {
                            guard rows.indices.contains(nextIndex) else {
                                break
                            }
                            
                            let nextAvailableIndicies = rows[nextIndex].availableIndicies(for: span)
                            canAdd = nextAvailableIndicies.contains(columnIndex)
                            
                            if !canAdd {
                                break
                            }
                        }
                        
                        if canAdd {
                            let rowIndicies = index..<index + span.vertical
                            for rowIndex in rowIndicies {
                                if !rows.indices.contains(rowIndex) {
                                    rows.append(Row(maxNumberOfItems: numberOfItemsInRow))
                                }
                                rows[rowIndex].add(span: span, at: columnIndex)
                            }
                            return Position(x: columnIndex, y: index)
                        }
                    }
                }
            }
            
            // If we are here, it means that all rows are occupied or empty
            for _ in 0..<span.vertical {
                var row = Row(maxNumberOfItems: numberOfItemsInRow)
                row.add(span: span, at: 0)
                rows.append(row)
            }
            
            return Position(x: 0, y: rows.count - span.vertical)
        }
    }
}

// MARK: - Row
extension RelaxedGridLayout.Rows {
    struct Row {
        // MARK: Typealiases
        typealias Position = RelaxedGridLayout.Grid.Position
        typealias Span = RelaxedGridLayout.Grid.Span
        
        // MARK: Properties
        private let maxNumberOfItems: Int
        private var occupiedRanges = [Range<Int>]()
        
        // MARK: Init
        init(maxNumberOfItems: Int) {
            self.maxNumberOfItems = max(2, maxNumberOfItems)
        }
        
        // MARK: Funcs
        func availableIndicies(for span: Span) -> [Int] {
            var range: Range<Int>?
            
            var result = [Int]()
            for index in 0..<maxNumberOfItems {
                if !occupiedRanges.contains(index) {
                    if range == nil {
                        range = index..<index + 1
                    } else {
                        range = range!.lowerBound..<index + 1
                    }
                    if range!.count >= span.horizontal {
                        result.append(range!.upperBound - span.horizontal)
                    }
                } else if range != nil {
                    range = nil
                }
            }
            
            if let range, range.count == span.horizontal {
                result.append(range.lowerBound)
            }
            
            return result
        }
        
        mutating func add(span: Span, at index: Int) {
            let newRange = index..<index + span.horizontal
            
            guard !occupiedRanges.isEmpty else {
                occupiedRanges.append(newRange)
                return
            }
            
            for (index, range) in occupiedRanges.enumerated() {
                if newRange.lowerBound >= range.upperBound {
                    if newRange.lowerBound == range.upperBound {
                        occupiedRanges[index] = range.lowerBound..<newRange.upperBound
                    } else {
                        occupiedRanges.insert(newRange, at: index)
                    }
                    
                    return
                }
                
                if newRange.upperBound <= range.lowerBound {
                    if newRange.upperBound == range.lowerBound {
                        occupiedRanges[index] = newRange.lowerBound..<range.upperBound
                    } else {
                        occupiedRanges.insert(newRange, at: index)
                    }
                    
                    return
                }
            }
        }
    }
}

// MARK: - Helpers
private extension [Range<Int>] {
    func contains(_ element: Int) -> Bool {
        contains { $0.contains(element) }
    }
}
