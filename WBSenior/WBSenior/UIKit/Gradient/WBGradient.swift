//
//  WBGradient.swift
//  WBSenior
//
//  Created by Александр Плетников on 07.07.2024.
//

import SwiftUI

struct WBGradient {

    static let bgGradient = LinearGradient(
        gradient: Gradient(
            colors: [
                Color(hex: 0x1D0628), Color(hex: 0x0F0A23)
            ]
        ),
        startPoint: .top,
        endPoint: .bottom
    )
}
