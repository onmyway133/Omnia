//
//  Debouncer.swift
//  Omnia
//
//  Created by khoa on 26/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import Foundation

/// Run the action after delay
public class Debouncer {
    private let delay: TimeInterval
    private var workItem: DispatchWorkItem?
    private let queue: DispatchQueue

    public init(delay: TimeInterval, queue: DispatchQueue = .main) {
        self.delay = delay
        self.queue = queue
    }

    public func run(action: @escaping () -> Void) {
        workItem?.cancel()
        let workItem = DispatchWorkItem(block: action)
        queue.asyncAfter(deadline: .now() + delay, execute: workItem)
        self.workItem = workItem
    }

    public func cancel() {
        workItem?.cancel()
    }
}
