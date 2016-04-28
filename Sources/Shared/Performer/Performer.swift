//
//  Performer.swift
//  Omnia
//
//  Created by Khoa Pham on 28/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public struct Performer {

  public static func sync(queue: Queue = Queue.main, action: Action) {
    dispatch_sync(queue.queue, action)
  }

  public static func async(queue: Queue = Queue.main, action: Action) {
    dispatch_async(queue.queue, action)
  }

  public static func after(seconds: NSTimeInterval, queue: Queue = Queue.main, action: Action) {
    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
    dispatch_after(delayTime, queue.queue, action)
  }
}
