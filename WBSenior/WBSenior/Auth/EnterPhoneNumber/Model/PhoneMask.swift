//
//  PhoneMask.swift
//  WBSenior
//
//  Created by Александр Плетников on 07.07.2024.
//

struct PhoneMask {
    enum Location {
        case ru
    }

    private(set) var placeholder = "_"

    var mask: String {
        switch location {
        case .ru: return "+\(countryCode) (___) ___ - __ - __"
        }
    }

    var countryCode: String {
        switch location {
        case .ru: return "7"
        }
    }

    private let location: Location

    init(location: Location) {
        self.location = location
    }

    var numberCount: Int {
        return mask.reduce(0) { String($1) == placeholder ? $0 + 1 : $0 }
    }
}

