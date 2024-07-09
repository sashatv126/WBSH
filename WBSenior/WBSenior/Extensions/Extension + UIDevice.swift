//
//  Extension + UIDevice.swift
//  WBSenior
//
//  Created by Александр Плетников on 01.07.2024.
//

import SwiftUI

extension UIDevice {

    static var isIpad: Bool {
        UIDevice().userInterfaceIdiom == .pad
    }
}
