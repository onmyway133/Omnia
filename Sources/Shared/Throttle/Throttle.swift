//
//  Throttle.swift
//  Omnia
//
//  Created by Khoa Pham on 28/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public class Throttle {
  fileprivate let interval: TimeInterval
  fileprivate let queue: DispatchQueue

  public typealias Action = () -> Void

  open var actionBlock: Action?
  open var cancelBlock: Action?

  fileprivate var source: DispatchSource?

  public init(interval: TimeInterval,
              queue: DispatchQueue = DispatchQueue.main,
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

  open func fire() {
    cancel()

    let s = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags(rawValue: 0), queue: queue)
    _ = DispatchTime.now() + Double(Int64(interval) * Int64(NSEC_PER_SEC)) / Double(NSEC_PER_SEC)
//    s.setTimer(start: time, interval: DispatchTime.distantFuture, leeway: 0);

    s.setEventHandler { [weak self] in
      self?.action()
      self?.cancel()
    }

    s.resume()
//    source = s
  }

  fileprivate func action() {
    actionBlock?()
  }

  fileprivate func cancel() {
    if let source = source {
      source.cancel()
    }

    source = nil

    cancelBlock?()
  }
}
