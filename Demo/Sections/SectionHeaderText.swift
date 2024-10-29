import SwiftUI

struct SectionHeaderText: View {
    let icon: String
    let text: String
    
    var body: some View {
        Text("\(Image(systemName: icon)) \(text)")
    }
}

#Preview {
    SectionHeaderText(icon: "heart", text: "Section")
}
