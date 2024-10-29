import SwiftUI

struct RelaxedGridSection: View {
    var section: SectionCollection.Element
    
    @Environment(\.displayScale)
    private var displayScale
    
    @State
    private var viewState = ViewState()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header
            
            content
        }
        .mask {
            backgroundShape
                .offset(y: viewState.backgroundOffset)
                .frame(height: viewState.backgroundHeight)
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .background(alignment: .bottom) { sectionBackground }
        .onGeometryChange(for: CGRect.self) {
            $0.frame(in: .scrollView)
        } action: { frame in
            viewState.onScrollFrameChange(frame)
        }
        .opacity(viewState.sectionOpacity)
    }
    
    @ViewBuilder
    private var header: some View {
        if !section.header.isEmpty {
            section.header
                .textCase(.uppercase)
                .font(.callout)
                .lineLimit(1)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(
                    top: max(headerInsets.top, 0),
                    leading: max(headerInsets.leading, 0),
                    bottom: max(headerInsets.bottom, 0),
                    trailing: max(headerInsets.trailing, 0)
                ))
                .scaleEffect(viewState.sectionScale)
                .offset(y: viewState.headerOffset)
                .readGeometry(\.size.height, to: $viewState.headerHeight)
        }
    }
    
    @ViewBuilder
    private var content: some View {
        GeometryReader { g in
            VStack {
                ForEach(Array(section.content.enumerated()), id: \.offset) { index, subview in
                    if index == section.content.indices.last {
                        lastContentRow(subview, index: index)
                    } else {
                        contentRow(subview, index: index)
                    }
                }
            }
            .frame(height: g.size.height)
        }
        .readGeometry(\.size.height, to: $viewState.contentHeight)
        .mask {
            Rectangle()
                .offset(y: viewState.backgroundOffset)
                .frame(height: viewState.backgroundHeight - viewState.headerHeight)
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
    
    @ViewBuilder
    private func lastContentRow(_ subview: SubviewsCollection.Element, index: Int) -> some View {
        let first = index == 0
        let disappearing = section.header.isEmpty && index == section.content.indices.last
        
        subview
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .readGeometry(\.size.height, to: $viewState.lastRowHeight)
            .padding(EdgeInsets(
                top: first ? max(contentInsets.top, 0) : 0,
                leading: max(contentInsets.leading, 0),
                bottom: max(contentInsets.bottom, 0),
                trailing: max(contentInsets.trailing, 0)
            ))
            .scaleEffect(disappearing ? viewState.sectionScale : 1.0)
            .offset(y: disappearing ? viewState.backgroundOffset : 0.0)
    }
    
    @ViewBuilder
    private func contentRow(_ subview: SubviewsCollection.Element, index: Int) -> some View {
        let first = index == 0
        
        subview
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(EdgeInsets(
                top: first ? max(contentInsets.top, 0) : 0,
                leading: max(contentInsets.leading, 0),
                bottom: 0,
                trailing: max(contentInsets.trailing, 0)
            ))
    }
    
    @ViewBuilder
    private var sectionBackground: some View {
        backgroundShape
            .foregroundStyle(backgroundStyle)
            .frame(height: viewState.backgroundHeight)
            .shadow(color: shadowColor, radius: shadowRadius, x: shadowOffset.x, y: shadowOffset.y)
            .scaleEffect(viewState.sectionScale)
            .offset(y: viewState.backgroundOffset)
    }
}

#Preview("Grid") {
    ZStack {
        LinearGradient(colors: [.blue, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
        
        RelaxedGrid {
            Section("1st section") {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<23) { index in
                            VStack {
                                Text("\(index)")
                                
                                Spacer()
                                
                                Image(systemName: "sun.max.fill")
                                    .symbolRenderingMode(.multicolor)
                                
                                Spacer()
                                
                                Text(Measurement(value: Double(Int.random(in: 3...25)), unit: UnitTemperature.celsius), format: .measurement(width: .narrow))
                            }
                            .frame(minWidth: 60, maxHeight: .infinity)
                        }
                    }
                    .padding()
                }
            }
            .relaxedGridSectionSpan(horizontal: 4, vertical: 1)
            .relaxedGridSectionContentInsets(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
            
            Section("2nd section") {
                Text("2 x 2")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .relaxedGridSectionSpan(horizontal: 2, vertical: 2)
            
            Section("3rd section") {
                List {
                    ForEach(0..<10) {
                        Text("\($0) row")
                    }
                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .scrollDisabled(true)
            }
            .relaxedGridSectionSpan(horizontal: 2, vertical: 3)
            
            Section("4th section") {
                Text("1 x 1")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
            
            Section("5th section") {
                VStack {
                    Text("1 x 1")
                    Text("1 x 1")
                    Text("1 x 1")
                    Text("1 x 1")
                    Text("1 x 1")
                    Text("1 x 1")
                    Text("1 x 1")
                    Text("1 x 1")
                    Text("1 x 1")
                    Text("1 x 1")
                    Text("1 x 1")
                    Text("1 x 1")
                    Text("1 x 1")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
            
            Section("6th section") {
                Text("1 x 1")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
            
            Section("7th section") {
                Text("1 x 1")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
            
            Section("8th section") {
                Text("1 x 1")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
            
            Section("9th section") {
                Text("1 x 1")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
            
            Section("10th section") {
                Text("1 x 1")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
            
            Section("11th section") {
                Text("1 x 1")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
            
            Section("12th section") {
                Text("1 x 1")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
            
            Section("13th section") {
                Text("1 x 1")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
        }
    }
}

// MARK: Helpers
private extension RelaxedGridSection {
    // MARK: Section Grid Span
    var span: RelaxedGridLayout.Grid.Span {
        section.containerValues.relaxedGridSectionSpan
    }
    
    // MARK: Section
    var headerInsets: EdgeInsets {
        section.containerValues.relaxedGridSectionHeaderInsets
    }
    
    var contentInsets: EdgeInsets {
        section.containerValues.relaxedGridSectionContentInsets
    }
    
    // MARK: Section Background
    var backgroundShape: AnyShape {
        section.containerValues.relaxedGridSectionBackgroundShape
    }
    
    var backgroundStyle: AnyShapeStyle {
        section.containerValues.relaxedGridSectionBackgroundStyle
    }
    
    var shadowColor: Color {
        section.containerValues.relaxedGridSectionShadowColor
    }
    
    var shadowRadius: CGFloat {
        section.containerValues.relaxedGridSectionShadowRadius
    }
    
    var shadowOffset: CGPoint {
        section.containerValues.relaxedGridSectionShadowOffset
    }
}
