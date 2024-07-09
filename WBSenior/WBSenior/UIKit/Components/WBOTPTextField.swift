//
//  WBOTPTextField.swift
//  WBSenior
//
//  Created by Александр Плетников on 02.07.2024.
//

import SwiftUI

struct WBOTPTextField: View {

    enum ViewState {
        case notFilled, success, error
    }

    let numberOfFields: Int
    @FocusState private var focusedValue: Int?
    @State private var symbols: [String]
    @Binding var text: String
    let state: ViewState

    init(
        numberOfFields: Int,
        text: Binding<String>,
        state: ViewState
    ) {
        self.numberOfFields = numberOfFields
        self._text = text
        self.state = state
        self.symbols = Array(repeating: "", count: numberOfFields)
    }

    var body: some View {
        HStack(spacing: 24) {
            ForEach(0..<numberOfFields, id: \.self) { index in
                TextField("", text: $symbols[index])
                    .foregroundStyle(BasicColor.white)
                    .font(BasicFont.title36)
                    .keyboardType(.numberPad)
                    .tint(.clear)
                    .frame(maxHeight: .infinity)
                    .background(BasicColor.opacity8percent)
                    .cornerRadius(12, corners: .allCorners)
                    .focused($focusedValue, equals: index)
                    .tag(index)
                    .multilineTextAlignment(.center)
                    .textContentType(.oneTimeCode)
                    .overlay(border(state: state))
                    .onChange(of: symbols[index]) { newValue in
                        if newValue.count > 1 {
                            symbols[index] = String(newValue.prefix(1))
                        }
                        updateFocusField(text: newValue, index: index)
                    }
                    .animation(.linear, value: state)
            }
        }
    }
}

// MARK: - Views

private extension WBOTPTextField {

    @ViewBuilder
    func border(state: ViewState) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(
                state == .success ? TextColor.green : TextColor.red,
                lineWidth: state == .notFilled ? 0 : 1.0
            )
    }
}

private extension WBOTPTextField {

    func updateText() {
        text = symbols.joined()
    }

    func updateFocusField(text: String, index: Int) {
        let currentFocusedValue = focusedValue ?? .zero
        if text.isEmpty {
            focusedValue = currentFocusedValue - 1
        } else if index != numberOfFields - 1 {
            focusedValue = currentFocusedValue + 1
        }
        updateText()
    }
}
