import SwiftUI
import MapKit

struct WindMapSection: View {
    private let mapCameraPosition = {
        let coordinate = CLLocationCoordinate2D(latitude: 49.194507, longitude: 16.610555)
        let distance = 200_000.0
        let region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: distance,
            longitudinalMeters: distance
        )
        return MapCameraPosition.region(region)
    }()
    
    var body: some View {
        Section {
            Map(initialPosition: mapCameraPosition, interactionModes: [])
                .clipShape(RoundedRectangle(cornerRadius: 12))
        } header: {
            SectionHeaderText(icon: "wind", text: "Wind Map")
        }
    }
}

#Preview {
    WindMapSection()
}
