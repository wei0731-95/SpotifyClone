import SwiftUI

/// 顏色放在 Assets.xcassets 的 Color Set，分別設定了淺色 / 深色兩種外觀
enum Theme {
    static let background = Color("Background")
    static let card = Color("CardBackground")
    static let chip = Color("ChipBackground")
    static let primaryText = Color("PrimaryText")
    static let secondaryText = Color("SecondaryText")

    static let spotifyGreen = Color(red: 30 / 255, green: 215 / 255, blue: 96 / 255)
}
