//
//  PhoneCode.swift
//  WBSenior
//
//  Created by Александр Плетников on 06.07.2024.
//

struct PhoneCode {
    private var successCode: String = ""
    var code: String = ""

    var isFilled: Bool {
        guard !successCode.isEmpty else { return false }
        return code.count == successCode.count
    }

    var isValid: Bool {
        guard !successCode.isEmpty else { return false }
        return code == successCode
    }

    mutating func updateSuccesCode(code: String) {
        successCode = code
    }
}

extension PhoneCode {

    var textFieldState: WBOTPTextField.ViewState {
        if isFilled, isValid {
            return .success
        } else if isFilled {
            return .error
        } else {
            return .notFilled
        }
    }
}
