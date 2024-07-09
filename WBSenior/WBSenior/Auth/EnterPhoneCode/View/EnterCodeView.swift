//
//  EnterCodeView.swift
//  WBSenior
//
//  Created by Александр Плетников on 30.06.2024.
//

import SwiftUI

struct EnterCodeView: View {

    // MARK: Properties

    @State private var model: PhoneCode = .init()
    @State private var isLoading: Bool = false
    let phoneNumber: String
    @EnvironmentObject private var sentCode: SentCode

    // MARK: Body

    var body: some View {

        AuthBackgroundView {
            if isLoading {
                ProgressView()
                    .controlSize(.large)
                    .foregroundStyle(BasicColor.white)
                    .tint(BasicColor.purple)
            } else {
                VStack(spacing: 16) {
                    Image(ImageName.letterIcon)
                        .frame(width: 40, height: 40)

                    title
                        .padding(.bottom, 24)

                    WBOTPTextField(
                        numberOfFields: 4,
                        text: $model.code,
                        state: model.textFieldState
                    )
                    .frame(height: 80)
                    .padding(.bottom, 30)
                    .overlay(alignment: .bottom) {
                        if model.textFieldState == .error {
                            errorTitle
                        }
                    }

                    if sentCode.remainingTime != .zero {
                        subTitle
                    } else {
                        sendAgainButton
                    }

                    if !UIDevice.isIpad {
                        Spacer()
                    }

                    WBButton(title: "Авторизоваться") {
                        if model.textFieldState == .success {
                            isLoading = true
                        }
                    }
                }
            }

        }
        .onReceive(sentCode.$successCode) { newSuccessCode in
            model.updateSuccesCode(code: newSuccessCode)
        }
        .hideKeyboardWithTapGesture()
    }
}

private extension EnterCodeView {

    @ViewBuilder
    var title: some View {
        Text(phoneNumber)
            .foregroundColor(TextColor.white)
            .font(BasicFont.title24)
    }

    @ViewBuilder
    var subTitle: some View {
        Text("Запросить повторно через \(sentCode.remainingTime) сек")
            .foregroundColor(TextColor.white)
            .font(BasicFont.body14)
    }

    @ViewBuilder
    var errorTitle: some View {
        Text("Неверный код")
            .foregroundColor(TextColor.red)
            .font(BasicFont.body14)
    }

    @ViewBuilder
    var sendAgainButton: some View {
        Button {
            sentCode.resentCode()
        } label: {
            Text("Отправить код повторно")
                .font(BasicFont.body14)
                .foregroundColor(TextColor.white)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}
