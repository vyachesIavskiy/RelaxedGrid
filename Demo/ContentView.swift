import SwiftUI
import RelaxedGrid

struct ContentView: View {
    @State
    private var scrollOffset = CGFloat(0)
    
    var body: some View {
        ZStack {
            GradientBackground()
            
            HeaderView(scrollOffset: scrollOffset)
            
            RelaxedGrid {
                HourlyForecastSection()
                    .relaxedGridSectionSpan(horizontal: 4, vertical: 1)
                    .relaxedGridSectionContentInsets(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                
                WindMapSection()
                    .relaxedGridSectionSpan(horizontal: 2, vertical: 2)
                
                DailyForecastSection()
                    .relaxedGridSectionSpan(horizontal: 2, vertical: 3)
                
                UVIndexSection()
                    .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
                
                SunPhaseSection()
                    .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
                    .relaxedGridSectionContentInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                
                WindSection()
                    .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
                
                MoonSection()
                    .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
                
                PrecipitationSection()
                    .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
                
                FeelsLikeSection()
                    .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
                
                HumiditySection()
                    .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
                
                VisibilitySection()
                    .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
                
                PressureSection()
                    .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
                
                AveragesSection()
                    .relaxedGridSectionSpan(horizontal: 1, vertical: 1)
            }
            .colorScheme(.dark)
            .scrollIndicators(.hidden)
            .safeAreaPadding(.top, 170)
            .relaxedGridEdgeInsets(EdgeInsets(top: 230, leading: 12, bottom: 16, trailing: 12))
            .onScrollGeometryChange(for: CGFloat.self) { sg in
                sg.contentOffset.y + sg.contentInsets.top
            } action: { oldValue, newValue in
                scrollOffset = newValue
            }
        }
    }
}

#Preview {
    ContentView()
}
