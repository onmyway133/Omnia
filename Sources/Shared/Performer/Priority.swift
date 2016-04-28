//
//  Priority.swift
//  Omnia
//
//  Created by Khoa Pham on 28/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public extension Performer {
  public enum Priority: RawRepresentable {
    case High
    case Low
    case Background
    case Default

    public init?(rawValue: dispatch_queue_priority_t) {
      return nil
    }

    public var rawValue: dispatch_queue_priority_t {
      switch self {
      case .High:
        return DISPATCH_QUEUE_PRIORITY_HIGH
      case .Low:
        return DISPATCH_QUEUE_PRIORITY_LOW
      case .Background:
        return DISPATCH_QUEUE_PRIORITY_BACKGROUND
      case .Default:
        return DISPATCH_QUEUE_PRIORITY_DEFAULT
      }
    }

    public init() {
      self = .Default
    }
  }
}
