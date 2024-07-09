//
//  PhoneNumberTextField.swift
//  WBSenior
//
//  Created by Александр Плетников on 06.07.2024.
//

import SwiftUI

struct PhoneNumberTextField: View {
    @FocusState private var isFocused: Bool
    @Binding var model: PhoneNumber

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if !model.phoneIsValid {
                errorMessage
            }
            HStack {
                ZStack(alignment: .leading) {
                    phoneNumberMaskView
                    TextField("", text: $model.phoneNumber)
                        .onChange(of: model.phoneNumber, perform: { newValue in
                            if newValue.count > model.phoneNumberCount {
                                model.phoneNumber = String(newValue.prefix(model.phoneNumberCount))
                            } else {
                                withAnimation {
                                    model.phoneIsValid = true
                                }
                            }
                        })
                        .keyboardType(.numberPad)
                        .focused($isFocused)
                        .accentColor(.clear)
                        .textSelection(.disabled)
                        .foregroundColor(.clear)
                        .frame(maxWidth: .infinity)
                }

                Spacer()

                clearButton
            }
        }
        .padding(.horizontal, 16)
        .frame(height: 48)
        .frame(maxWidth: .infinity)
        .background(BasicColor.opacity8percent)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .onTapGesture {
            isFocused = true
        }
    }
}

private extension PhoneNumberTextField {

    @ViewBuilder
    var phoneNumberMaskView: some View {
        Text(model.maskedPhoneNumber)
            .font(BasicFont.body16)
            .foregroundColor(BasicColor.white)
    }

    @ViewBuilder
    var errorMessage: some View {
        Text("Некорректный формат номера")
            .font(BasicFont.body12)
            .foregroundColor(TextColor.red)
    }

    @ViewBuilder
    var clearButton: some View {
        Button {
            model.phoneNumber = ""
        } label: {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(BasicColor.white)
        }
    }
}
