//
//  Emoji.swift
//  Omnia
//
//  Created by Khoa Pham on 01/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import CoreFoundation

public struct Emoji {

  public static func standardName(emoji: Character) -> [String] {
    let string = NSMutableString(string: String(emoji))
    var range = CFRangeMake(0, CFStringGetLength(string))
    CFStringTransform(string, &range, kCFStringTransformToUnicodeName, false)

    return String(string).dropPrefix("\\N").componentsSeparatedByString("\\N").map {
      return $0.remove(Set(["{", "}"]))
    }
  }

  public static func list() -> [Character] {
    return Array(0x1F1FC..<0x1F600).map {
      return Character(UnicodeScalar($0))
    }
  }

  public static func flag(countryCode: String) -> Character {
    let base = UnicodeScalar("🇦").value - UnicodeScalar("A").value

    let string = countryCode.uppercaseString.unicodeScalars.reduce("") {
      var string = $0
      string.append(UnicodeScalar(base + $1.value))
      return string
    }

    return Character(string)
  }
}
