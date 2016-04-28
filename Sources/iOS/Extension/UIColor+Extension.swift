//
//  UIColor+Extension.swift
//  Omnia
//
//  Created by Khoa Pham on 28/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension UIColor {
  public class func rgb(red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
    return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
  }
}
