//
//  Extension + View.swift
//  WBSenior
//
//  Created by Александр Плетников on 01.07.2024.
//

import SwiftUI

extension View {

    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }

    func hideKeyboardWithTapGesture() -> some View {
        self.modifier(HideKeyboardModifier())
    }
}

private struct RoundedCorner: Shape {

    private let radius: CGFloat
    private let corners: UIRectCorner

    init(radius: CGFloat = .infinity, corners: UIRectCorner = .allCorners) {
        self.radius = radius
        self.corners = corners
    }

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )

        return Path(path.cgPath)
    }
}

private struct HideKeyboardModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(Rectangle())
            .onTapGesture {
                hideKeyboard()
            }
    }

    private func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
