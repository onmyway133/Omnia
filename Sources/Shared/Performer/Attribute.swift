//
//  Attribute.swift
//  Omnia
//
//  Created by Khoa Pham on 28/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public extension Performer {
  public enum Attribute: RawRepresentable {
    case Serial
    case Concurrent

    public init?(rawValue: dispatch_queue_attr_t!) {
      return nil
    }

    public var rawValue: dispatch_queue_attr_t! {
      switch self {
      case .Serial:
        return DISPATCH_QUEUE_SERIAL
      case .Concurrent:
        return DISPATCH_QUEUE_CONCURRENT
      }
    }

    public init() {
      self = .Serial
    }
  }
}
