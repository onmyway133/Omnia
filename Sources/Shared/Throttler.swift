//
//  Throttler.swift
//  Omnia
//
//  Created by khoa on 12/02/2021.
//

import Foundation

/// Run the action once during timeframe
public class Throttler {
    private let timeFrame: TimeInterval
    private let queue: DispatchQueue
    private var runAt: Date?

    public init(timeFrame: TimeInterval, queue: DispatchQueue = .main) {
        self.timeFrame = timeFrame
        self.queue = queue
    }

    public func run(action: @escaping () -> Void) {
        let now = Date()
        if let runAt = runAt, now.timeIntervalSince(runAt) < timeFrame {
            return
        }

        queue.async(execute: action)
        runAt = now
    }
}
