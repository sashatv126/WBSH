//
//  WbButton.swift
//  WBSenior
//
//  Created by Александр Плетников on 01.07.2024.
//

import SwiftUI

struct WBButton: View {

    // MARK: Properties

    let title: String
    var action: () -> ()

    // MARK: Body

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(BasicFont.body16)
                .foregroundColor(.white)
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity)
                .background(BasicColor.purple)
                .cornerRadius(12, corners: .allCorners)
        }
    }
}
