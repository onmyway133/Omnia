//
//  QualityOfService.swift
//  Omnia
//
//  Created by Khoa Pham on 28/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public extension Performer {
  public enum QualityOfService: RawRepresentable {
    case UserInteractive
    case UserInitiated
    case Default
    case Utility
    case Background
    case Unspecified

    public init?(rawValue: qos_class_t) {
      return nil
    }

    public var rawValue: qos_class_t {
      switch self {
      case .UserInteractive:
        return QOS_CLASS_USER_INTERACTIVE
      case .UserInitiated:
        return QOS_CLASS_USER_INITIATED
      case .Default:
        return QOS_CLASS_DEFAULT
      case .Utility:
        return QOS_CLASS_UTILITY
      case .Background:
        return QOS_CLASS_BACKGROUND
      case .Unspecified:
        return QOS_CLASS_UNSPECIFIED
      }
    }

    public init() {
      self = .Default
    }
  }
}
