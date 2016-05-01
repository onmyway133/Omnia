//
//  String+Extension.swift
//  Omnia
//
//  Created by Khoa Pham on 01/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import Sugar

public extension String {
  public func remove(set: Set<String>) -> String {
    var string = self
    set.forEach {
      string = string.replace($0, with: "")
    }

    return string
  }
}
