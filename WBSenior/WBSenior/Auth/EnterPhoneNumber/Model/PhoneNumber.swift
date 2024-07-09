//
//  PhoneNumber.swift
//  WBSenior
//
//  Created by Александр Плетников on 06.07.2024.
//

import Foundation

struct PhoneNumber {
    private var phoneNumberMask: PhoneMask = PhoneMask(location: .ru)
    var phoneNumber: String
    var phoneIsValid: Bool = true

    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }

    var phoneNumberCount: Int {
        phoneNumberMask.numberCount
    }

    var maskedPhoneNumber: String {
        let mask = phoneNumberMask.mask
        let placeholder = phoneNumberMask.placeholder
        var formattedPhoneNumber = ""
        var index = phoneNumber.startIndex

        for maskChar in mask {
            if String(maskChar) == placeholder, index < phoneNumber.endIndex {
                formattedPhoneNumber.append(phoneNumber[index])
                index = phoneNumber.index(after: index)
            } else {
                formattedPhoneNumber.append(maskChar)
            }
        }

        return formattedPhoneNumber
    }

    mutating func validateFields() {
        phoneIsValid = !(phoneNumber.count < phoneNumberCount)
    }
}
