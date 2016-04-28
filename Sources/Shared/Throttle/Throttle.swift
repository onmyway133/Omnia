//
//  Throttle.swift
//  Omnia
//
//  Created by Khoa Pham on 28/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public class Throttle {
  private let interval: NSTimeInterval
  private let queue: dispatch_queue_t

  public var actionBlock: Action?
  public var cancelBlock: Action?

  private var source: dispatch_source_t?

  public init(interval: NSTimeInterval,
              queue: dispatch_queue_t = dispatch_get_main_queue(),
              actionBlock: Action? = nil,
              cancelBlock: Action? = nil) {

    self.interval = interval
    self.queue = queue
    self.actionBlock = actionBlock
    self.cancelBlock = cancelBlock
  }

  deinit {
    cancel()
  }

  public func fire() {
    cancel()

    let s = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(interval) * Int64(NSEC_PER_SEC))
    dispatch_source_set_timer(s, time, DISPATCH_TIME_FOREVER, 0);

    dispatch_source_set_event_handler(s) { [weak self] in
      self?.action()
      self?.cancel()
    }

    dispatch_resume(s)
    source = s
  }

  private func action() {
    actionBlock?()
  }

  private func cancel() {
    if let source = source {
      dispatch_source_cancel(source)
    }

    source = nil

    cancelBlock?()
  }
}

