//
//  EnterPhoneView.swift
//  WBSenior
//
//  Created by Александр Плетников on 07.07.2024.
//

import SwiftUI

struct EnterPhoneView: View {
    @State private var phoneModel = PhoneNumber(phoneNumber: "")
    @State private var isPresentedEnterCode: Bool = false

    var body: some View {
        AuthBackgroundView {
            VStack(spacing: .zero) {
                title

                avatar

                subTitle

                PhoneNumberTextField(model: $phoneModel)
                .padding(.top, 16)

                if !UIDevice.isIpad {
                    Spacer()
                }

                WBButton(title: "Запросить код") {
                    withAnimation {
                        phoneModel.validateFields()
                        isPresentedEnterCode = phoneModel.phoneIsValid
                    }
                }
            }
        }
        .navigationDestination(isPresented: $isPresentedEnterCode, destination: {
            EnterCodeView(phoneNumber: phoneModel.maskedPhoneNumber.replacingOccurrences(of: " ", with: ""))
                .environmentObject(SentCode())
        })
        .hideKeyboardWithTapGesture()
    }
}

private extension EnterPhoneView {

    @ViewBuilder
    var title: some View {
        Text("Aвторизация")
            .foregroundColor(BasicColor.white)
            .font(BasicFont.title24)
    }

    @ViewBuilder
    var avatar: some View {
        Image("avatar")
            .frame(width: 96, height: 96)
            .background(Color.red)
            .clipShape(Circle())
            .padding(.top, 12)
    }

    @ViewBuilder
    var subTitle: some View {
        Text("Вход по номеру телефона")
            .foregroundColor(BasicColor.white)
            .font(BasicFont.body16)
    }
}
