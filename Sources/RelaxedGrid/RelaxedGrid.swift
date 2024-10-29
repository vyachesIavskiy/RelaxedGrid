import SwiftUI

public struct RelaxedGrid<Sections: View>: View {
    private let sections: Sections
    
    @Environment(\.relaxedGridEdgeInsets)
    private var relaxedGridEdgeInsets
    
    @Environment(\.horizontalSizeClass)
    private var horizontalSizeClass
    
    @Environment(\.verticalSizeClass)
    private var verticalSizeClass
    
    public init(@ViewBuilder sections: () -> Sections) {
        self.sections = sections()
    }
    
    public var body: some View {
        ScrollView {
            RelaxedGridLayout(horizontalSizeClass: horizontalSizeClass, verticalSizeClass: verticalSizeClass) {
                Group(sections: sections) { sections in
                    ForEach(sections) { section in
                        RelaxedGridSection(section: section)
                            .relaxedGridSpan(section.containerValues.relaxedGridSectionSpan)
                    }
                }
            }
            .padding(relaxedGridEdgeInsets)
        }
    }
}
