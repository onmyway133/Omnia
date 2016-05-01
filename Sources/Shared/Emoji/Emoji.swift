//
//  Emoji.swift
//  Omnia
//
//  Created by Khoa Pham on 01/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import CoreFoundation
import Sugar

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
    let ranges = [
      0x1F601...0x1F64F,
      0x2702...0x27B0,
      0x1F680...0x1F6C0,
      0x1F170...0x1F251
    ]

    return ranges.flatten().map {
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

  public static func search(keywords: [String]) -> [Character] {
    var result: [Character] = []

    list().forEach { emoji in
      keywords.forEach { keyword in
        Emoji.standardName(emoji).forEach { name in
          if name.contains(keyword) {
            result.append(emoji)
          }
        }
      }
    }

    return result
  }
}
