//
//  BasicFont.swift
//  WBSenior
//
//  Created by Александр Плетников on 30.06.2024.
//

import SwiftUI

enum BasicFont {
    case regular, medium, semiBold

    static let title24: Font = BasicFont.font(size: 24, style: .semiBold)
    static let title36: Font = BasicFont.font(size: 36, style: .medium)
    static let body14: Font = BasicFont.font(size: 14, style: .regular)
    static let body12: Font = BasicFont.font(size: 12, style: .regular)
    static let body16: Font = BasicFont.font(size: 16, style: .medium)
}

extension BasicFont {

    private static func font(size: CGFloat, style: BasicFont) -> Font {
        let fontName = fontName(from: style)
        return .custom(fontName, size: size)
    }

    private static func fontName(from font: BasicFont) -> String {
        let fontName: String
        switch font {
        case .regular:
            fontName = "Montserrat-Regular"
        case .medium:
            fontName = "Montserrat-Medium"
        case .semiBold:
            fontName = "Montserrat-SemiBold"
        }
        return fontName
    }
}
