//
//  Task.swift
//  Omnia
//
//  Created by Khoa Pham on 28/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public extension Performer {
  
  public struct Task {
    let operation: Action -> Void

    public init(operation: Action -> Void) {
      self.operation = operation
    }

    // Static
    public func on(queue: Queue = Queue.main, action: Action) -> Task {
      return Task() { completion in
        let block = dispatch_block_create(BlockFlag().rawValue) {
          action()
          completion()
        }

        Performer.async(queue, action: block)
      }
    }

    public func delay(seconds: NSTimeInterval, queue: Queue = Queue.main, action: Action) -> Task {
      return Task() { completion in
        let block = dispatch_block_create(BlockFlag().rawValue) {
          action()
          completion()
        }

        Performer.after(seconds, queue: queue, action: block)
      }
    }
  }
}
