import SwiftUI

extension View {
    @ViewBuilder
    func readGeometry<T: Equatable>(_ keyPath: KeyPath<GeometryProxy, T>, to binding: Binding<T>) -> some View {
        onGeometryChange(for: T.self) { g in
            g[keyPath: keyPath]
        } action: { newValue in
            binding.wrappedValue = newValue
        }
    }
    
    @ViewBuilder
    func readGeometry<T: Equatable>(_ keyPath: KeyPath<GeometryProxy, T>, to binding: Binding<T?>) -> some View {
        onGeometryChange(for: T?.self) { g in
            g[keyPath: keyPath]
        } action: { newValue in
            binding.wrappedValue = newValue
        }
    }
    
    @ViewBuilder
    func readGeometry<T: Equatable>(_ binding: Binding<T>, of transform: @escaping (GeometryProxy) -> T) -> some View {
        onGeometryChange(for: T.self, of: transform) { binding.wrappedValue = $0 }
    }
    
    @ViewBuilder
    func readGeometry<T: Equatable>(_ binding: Binding<T?>, of transform: @escaping (GeometryProxy) -> T?) -> some View {
        onGeometryChange(for: T?.self, of: transform) { binding.wrappedValue = $0 }
    }
}
