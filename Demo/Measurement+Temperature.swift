import Foundation

extension Measurement<UnitTemperature> {
    static func temperature(_ degrees: Double) -> Self {
        Measurement(value: degrees, unit: .celsius)
    }
}

extension FormatStyle where Self == Measurement<UnitTemperature>.FormatStyle {
    static var temperature: Self {
        .measurement(width: .narrow)
    }
}
