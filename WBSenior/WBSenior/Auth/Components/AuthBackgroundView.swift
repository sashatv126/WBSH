//
//  AuthBackgroundView.swift
//  WBSenior
//
//  Created by Александр Плетников on 01.07.2024.
//

import SwiftUI

struct AuthBackgroundView<Content>: View where Content: View {

    // MARK: Properties

    private let content: () -> Content

    // MARK: Init

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    // MARK: Body

    var body: some View {
        ZStack {
            if UIDevice.isIpad {
                Image(ImageName.authBackground)
                    .resizable()
                    .ignoresSafeArea(.all)
            }

            if UIDevice.isIpad {
                generalContent
                    .cornerRadius(28, corners: .allCorners)
            } else {
                generalContent
            }
        }
    }

    // MARK: Views

    private var generalContent: some View {
        content()
            .padding(.horizontal, 24)
            .padding(.top, 40)
            .padding(.bottom, 48)

            .frame(
                maxWidth: UIDevice.isIpad ? 400 : .infinity,
                maxHeight: UIDevice.isIpad ? 429 : .infinity
            )
            .background(
                WBGradient.bgGradient
                    .ignoresSafeArea()
            )
    }
}
