import SwiftUI

struct RelaxedGridLayout: Layout {
    static var layoutProperties: LayoutProperties {
        var layoutProperties = LayoutProperties()
        layoutProperties.stackOrientation = .vertical
        return layoutProperties
    }
    
    // MARK: External properties
    private var horizontalSizeClass: UserInterfaceSizeClass?
    private var verticalSizeClass: UserInterfaceSizeClass?
    
    // MARK: Properties
    private var iPhonePortrait: Bool {
        horizontalSizeClass == .compact && verticalSizeClass == .regular
    }
    
    // MARK: Init
    init(horizontalSizeClass: UserInterfaceSizeClass?, verticalSizeClass: UserInterfaceSizeClass?) {
        self.horizontalSizeClass = horizontalSizeClass
        self.verticalSizeClass = verticalSizeClass
    }
    
    // MARK: Funcs
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout Cache) -> CGSize {
        let width = proposal.replacingUnspecifiedDimensions().width
        
        guard width != cache.layoutSize.width || cache.itemFrames.count != subviews.count else {
            return cache.layoutSize
        }
        
        cache.invalidate()
        cache.layoutSize.width = width
        
        let numberOfItemsInRow = {
            if iPhonePortrait {
                return CGFloat(NumberOfItemsInRow.min)
            } else {
                var numberOfItems = (width / ItemSize.ideal).rounded()
                let minNumberOfItemsInRow = CGFloat(NumberOfItemsInRow.min)
                let maxNumberOfItemsInRow = CGFloat(NumberOfItemsInRow.max)
                if numberOfItems < minNumberOfItemsInRow {
                    numberOfItems = minNumberOfItemsInRow
                } else if numberOfItems > maxNumberOfItemsInRow {
                    numberOfItems = maxNumberOfItemsInRow
                }
                return numberOfItems
            }
        }()
        cache.numberOfItemsInRow = Int(numberOfItemsInRow)
        
        let spacing = if numberOfItemsInRow > 2 {
            Spacing.regular
        } else {
            Spacing.compact
        }
        cache.spacing = spacing
        
        let itemSize = {
            let spacingWidth = (numberOfItemsInRow - 1) * spacing
            let itemSize = (width - spacingWidth) / numberOfItemsInRow
            
            return if iPhonePortrait {
                itemSize
            } else {
                min(ItemSize.max, itemSize)
            }
        }()
        cache.itemSize = itemSize
        
        var rows = Rows(numberOfItemsInRow: Int(numberOfItemsInRow))
        for subview in subviews {
            var span = subview[GridSpanLayoutValueKey.self]
            if span.horizontal > cache.numberOfItemsInRow {
                span.horizontal = cache.numberOfItemsInRow
            }
            let gridPosition = rows.addSpan(span)
            cache.itemGridPositions.append(gridPosition)
        }
        
        let height = CGFloat(rows.count) * itemSize + CGFloat(max(0, rows.count - 1)) * spacing
        cache.layoutSize.height = height
        
        return cache.layoutSize
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout Cache) {
        for (index, subview) in subviews.enumerated() {
            guard !cache.itemFrames.indices.contains(index) else {
                let frame = cache.itemFrames[index]
                subview.place(at: frame.origin, proposal: ProposedViewSize(frame.size))
                continue
            }
            
            var span = subview[GridSpanLayoutValueKey.self]
            if span.horizontal > cache.numberOfItemsInRow {
                span.horizontal = cache.numberOfItemsInRow
            }
            let gridPosition = cache.itemGridPositions[index]
            let itemSize = cache.itemSize
            let spacing = cache.spacing
            
            let horizontalPadding = {
                let numberOfItemsInRow = CGFloat(cache.numberOfItemsInRow)
                let itemsWidth = numberOfItemsInRow * itemSize
                let spacingWidth = (numberOfItemsInRow - 1) * spacing
                let fullWidth = itemsWidth + spacingWidth
                return (cache.layoutSize.width - fullWidth) * 0.5
            }()
            
            let x = {
                let gridX = CGFloat(gridPosition.x)
                let itemsOffset = gridX * itemSize
                let spacingOffset = gridX * spacing
                return bounds.origin.x + horizontalPadding + itemsOffset + spacingOffset
            }()
            
            let y = {
                let gridY = CGFloat(gridPosition.y)
                let itemsOffset = gridY * itemSize
                let spacingOffset = gridY * spacing
                return bounds.origin.y + itemsOffset + spacingOffset
            }()
            
            let width = {
                let hSpan = CGFloat(span.horizontal)
                let spanWidth = hSpan * itemSize
                let spacingWidth = (hSpan - 1) * spacing
                return spanWidth + spacingWidth
            }()
            
            let height = {
                let vSpan = CGFloat(span.vertical)
                let spanHeight = vSpan * itemSize
                let spacingHeight = (vSpan - 1) * spacing
                return spanHeight + spacingHeight
            }()
            
            cache.itemFrames.append(CGRect(x: x, y: y, width: width, height: height))
            
            subview.place(
                at: CGPoint(x: x, y: y),
                proposal: ProposedViewSize(width: width, height: height)
            )
        }
    }
    
    func makeCache(subviews: Subviews) -> Cache {
        Cache()
    }
    
    func updateCache(_ cache: inout Cache, subviews: Subviews) {
        // Do nothing, cache is updated in `sizeThatFits` func.
    }
}
