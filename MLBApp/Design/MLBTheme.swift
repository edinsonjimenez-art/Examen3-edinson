import SwiftUI

enum MLBTheme {
    static let background = Color(hex: 0x1A2129)
    static let surface = Color(hex: 0x060A0F)
    static let border = Color(hex: 0x656E78)
    static let blue = Color(hex: 0x006FAC)
    static let red = Color(hex: 0xCF243F)
    static let text = Color.white
    static let secondaryText = Color(hex: 0xB5BCC3)
    static let success = Color(hex: 0x70D6A0)

    static let splashFont = Font.custom("BarlowCondensed-Bold", size: 42, relativeTo: .largeTitle)
}

private extension Color {
    init(hex: UInt32) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: 1
        )
    }
}
