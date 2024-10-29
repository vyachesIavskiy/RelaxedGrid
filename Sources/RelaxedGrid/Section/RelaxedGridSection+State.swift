import SwiftUI

extension RelaxedGridSection {
    @MainActor @Observable
    final class ViewState {
        // MARK: Heights
        var sectionHeight = CGFloat(0)
        var headerHeight = CGFloat(0)
        var contentHeight = CGFloat(0)
        var lastRowHeight = CGFloat(0)
        var backgroundHeight = CGFloat(0)
        
        // MARK: Offsets
        var headerOffset = CGFloat(0)
        var backgroundOffset = CGFloat(0)
        
        // MARK: Section disappearing modifiers
        var sectionOpacity = 1.0
        var sectionScale = 1.0
        
        // MARK: Funcs
        func onScrollFrameChange(_ frame: CGRect) {
            sectionHeight = frame.height
            let offset = frame.minY
            
            if offset > 0 {
                backgroundHeight = sectionHeight
                
                headerOffset = 0.0
                backgroundOffset = 0.0
                
                sectionOpacity = 1.0
                sectionScale = 1.0
            } else {
                let resolvedTopHeight = headerHeight > 0 ? headerHeight : lastRowHeight
                
                backgroundHeight = max(sectionHeight + offset, resolvedTopHeight)
                
                headerOffset = min(-offset, sectionHeight)
                backgroundOffset = {
                    let maxBackgroundOffset = if headerHeight > 0 {
                        headerOffset - contentHeight
                    } else {
                        headerOffset - contentHeight + lastRowHeight
                    }
                    return max(0, maxBackgroundOffset)
                }()
                
                sectionOpacity = max(0.0, 1.0 - (backgroundOffset / resolvedTopHeight))
                sectionScale = max(0.95, 1.0 - (backgroundOffset / resolvedTopHeight * 0.05))
            }
        }
    }
}
