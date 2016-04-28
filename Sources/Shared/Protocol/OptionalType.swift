//
//  OptionalType.swift
//  Omnia
//
//  Created by Khoa Pham on 28/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public protocol OptionalType {
  associatedtype Wrapped
  var asOptional : Wrapped? { get }
}

extension Optional : OptionalType {
  public var asOptional : Wrapped? {
    return self
  }
}