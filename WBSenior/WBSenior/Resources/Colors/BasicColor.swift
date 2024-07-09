//
//  BasicColor.swift
//  WBSenior
//
//  Created by Александр Плетников on 29.06.2024.
//

import SwiftUI

enum BasicColor {
    static let white: Color = Color(hex: 0xffffff)
    static let purple: Color = Color(hex: 0x8400FF)
    static let blue: Color = Color(hex: 0x2346FF)
    static let darkPrp: Color = Color(hex: 0x1E0537)
    static let bgContainer = Color(hex: 0x1D0628)
    static let opacity8percent = Color(hex: 0xffffff, opacity: 0.08)
}

enum TextColor {
    static let white: Color = Color(hex: 0xffffff)
    static let green: Color = Color(hex: 0x01B574)
    static let description: Color = Color(hex: 0xA0AEC0)
    static let darkGray: Color = Color(hex: 0x56577A)
    static let red: Color = Color(hex: 0xEC0000)
}

extension Color {

    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}
