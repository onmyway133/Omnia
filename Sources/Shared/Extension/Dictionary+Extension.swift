//
//  Dictionary+Extension.swift
//  Omnia
//
//  Created by Khoa Pham on 28/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public extension Dictionary {
  public mutating func update(other: Dictionary) {
    for (key, value) in other {
      self.updateValue(value, forKey: key)
    }
  }
}

public extension Dictionary where Value: OptionalType {
  public func dropNils() -> Dictionary<String, AnyObject> {
    var result: [String: AnyObject] = [:]
    forEach {
      if let unwrapped = $1.asOptional as? AnyObject, key = $0 as? String {
        result[key] = unwrapped
      }
    }

    return result
  }
}
