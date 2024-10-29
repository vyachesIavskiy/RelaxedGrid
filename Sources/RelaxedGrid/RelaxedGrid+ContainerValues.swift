import SwiftUI

// MARK: - Container Value Entries
extension ContainerValues {
    // MARK: Grid Span
    @Entry var relaxedGridSectionSpan = RelaxedGridLayout.Grid.Span()
    
    // MARK: Insets
    @Entry var relaxedGridSectionHeaderInsets = EdgeInsets(top: 12, leading: 12, bottom: 8, trailing: 12)
    @Entry var relaxedGridSectionContentInsets = EdgeInsets(top: 0, leading: 12, bottom: 16, trailing: 12)
    
    // MARK: Background
    @Entry var relaxedGridSectionBackgroundShape = AnyShape(RoundedRectangle(cornerRadius: 12))
    @Entry var relaxedGridSectionBackgroundStyle = AnyShapeStyle(.thinMaterial.opacity(0.8))
    @Entry var relaxedGridSectionShadowColor = Color.black.opacity(0.25)
    @Entry var relaxedGridSectionShadowRadius = CGFloat(12)
    @Entry var relaxedGridSectionShadowOffset = CGPoint(x: 0, y: 0)
}

// MARK: - Convenience Setters
extension View {
    // MARK: Section Grid Span
    public func relaxedGridSectionSpan(horizontal: Int = 2, vertical: Int = 1) -> some View {
        containerValue(\.relaxedGridSectionSpan, RelaxedGridLayout.Grid.Span(horizontal: horizontal, vertical: vertical))
    }
    
    @available(*, deprecated, message: "Please pass one or more parameters.")
    public func relaxedGridSectionSpan() -> some View {
        relaxedGridSectionSpan(horizontal: 2, vertical: 1)
    }
    
    // MARK: Section
    public func relaxedGridSectionHeaderInsets(_ insets: EdgeInsets) -> some View {
        containerValue(\.relaxedGridSectionHeaderInsets, insets)
    }
    
    public func relaxedGridSectionContentInsets(_ insets: EdgeInsets) -> some View {
        containerValue(\.relaxedGridSectionContentInsets, insets)
    }
    
    // MARK: Section Background
    public func relaxedGridSectionBackgroundShape(_ shape: some Shape) -> some View {
        containerValue(\.relaxedGridSectionBackgroundShape, AnyShape(shape))
    }
    
    public func relaxedGridSectionBackgroundStyle(_ style: some ShapeStyle) -> some View {
        containerValue(\.relaxedGridSectionBackgroundStyle, AnyShapeStyle(style))
    }
    
    public func relaxedGridSectionShadowColor(_ color: Color) -> some View {
        containerValue(\.relaxedGridSectionShadowColor, color)
    }
    
    public func relaxedGridSectionShadowRadius(_ radius: CGFloat) -> some View {
        containerValue(\.relaxedGridSectionShadowRadius, radius)
    }
    
    public func relaxedGridSectionShadowOffset(_ offset: CGPoint) -> some View {
        containerValue(\.relaxedGridSectionShadowOffset, offset)
    }
}
