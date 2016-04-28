//
//  BlockFlag.swift
//  Omnia
//
//  Created by Khoa Pham on 28/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public extension Performer {
  public enum BlockFlag: RawRepresentable {
    case Barrier
    case Detached
    case AssignCurrent
    case NoQOSClass
    case InheritQOSClass
    case EnforceQOSClass

    public init?(rawValue: dispatch_block_flags_t) {
      return nil
    }

    public var rawValue: dispatch_block_flags_t {
      switch self {
      case .Barrier:
        return DISPATCH_BLOCK_BARRIER
      case .Detached:
        return DISPATCH_BLOCK_DETACHED
      case .AssignCurrent:
        return DISPATCH_BLOCK_ASSIGN_CURRENT
      case .NoQOSClass:
        return DISPATCH_BLOCK_NO_QOS_CLASS
      case .InheritQOSClass:
        return DISPATCH_BLOCK_INHERIT_QOS_CLASS
      case .EnforceQOSClass:
        return DISPATCH_BLOCK_ENFORCE_QOS_CLASS
      }
    }

    public init() {
      self = .InheritQOSClass
    }
  }
}
