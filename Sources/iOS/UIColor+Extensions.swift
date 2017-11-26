import UIKit

extension UIColor {

  /// Init color from hex string
  ///
  /// - Parameter hex: A hex string, with or without #
  public convenience init(omnia_hex hex: String) {
    let hex = hex.replacingOccurrences(of: "#", with: "")

    // Need 6 characters
    guard hex.count == 6 else {
      self.init(white: 1.0, alpha: 1.0)
      return
    }

    self.init(
      red:   CGFloat((Int(hex, radix: 16)! >> 16) & 0xFF) / 255.0,
      green: CGFloat((Int(hex, radix: 16)! >> 8) & 0xFF) / 255.0,
      blue:  CGFloat((Int(hex, radix: 16)!) & 0xFF) / 255.0, alpha: 1.0)
  }
}

/// Represent a HSL color
public struct HSLColor {
  public let hue: CGFloat
  public let saturation: CGFloat
  public let lightness: CGFloat
}

extension UIColor {

  /// Convert to HSL color
  public func omnia_toHSL() -> HSLColor {
    var h: CGFloat = 0
    var s: CGFloat = 0

    var r: CGFloat = 0
    var g: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0

    getRed(&r, green: &g, blue: &b, alpha: &a)

    let max = Swift.max(r, g, b)
    let min = Swift.min(r, g, b)

    let l = (min+max) / 2.0

    if (l <= 0.0) {
      return HSLColor(hue: h, saturation: s, lightness: l)
    }

    let delta = max - min
    s = delta

    if (s > 0.0) {
      s = s / ((l <= 0.5) ? (max + min) : (2.0 - max - min))
    } else {
      return HSLColor(hue: h, saturation: s, lightness: l)
    }

    let r2 = (max - r) / delta
    let g2 = (max - g) / delta
    let b2 = (max - b) / delta

    if (r == max) {
      h = (g == min ? 5.0 + b2 : 1.0 - g2)
    } else if (g == max) {
      h = (b == min ? 1.0 + r2 : 3.0 - b2)
    } else {
      h = (r == min ? 3.0 + g2 : 5.0 - r2)
    }

    h = h / 6.0

    return HSLColor(hue: h, saturation: s, lightness: l)
  }
}
