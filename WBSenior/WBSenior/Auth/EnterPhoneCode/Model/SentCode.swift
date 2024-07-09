//
//  SentCode.swift
//  WBSenior
//
//  Created by Александр Плетников on 07.07.2024.
//

import SwiftUI
import Combine

class SentCode: ObservableObject {
    @Published private var timer: Timer?
    @Published private(set) var remainingTime: Int
    private let timeToUpdate = 10

    @Published var successCode: String = ""

    init() {
        remainingTime = timeToUpdate
        startTimer()
        updateCode()
    }

    func resentCode() {
        stopTimer()
        updateCode()
        remainingTime = timeToUpdate
        startTimer()
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else {
                timer.invalidate()
                return
            }

            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                stopTimer()
            }
        }
        guard let timer else { return }
        RunLoop.main.add(timer, forMode: .common)
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    deinit {
        stopTimer()
    }
}

extension SentCode {

    // имитация обновления кода
    func updateCode() {
        let digits = "0123456789"
        var code = ""

        for _ in 0..<4 {
            let randomIndex = Int.random(in: 0..<digits.count)
            let digit = digits[digits.index(digits.startIndex, offsetBy: randomIndex)]
            code.append(digit)
        }

        print(code)
        successCode = code
    }
}
