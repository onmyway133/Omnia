import UIKit

extension UIColor {
    
    /// Init color from hex string
    ///
    /// - Parameter hex: A hex string, with or without #
    public convenience init(e_hex hex: String) {
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
    public var hue: CGFloat
    public var saturation: CGFloat
    public var lightness: CGFloat
    public var alpha: CGFloat
}

extension UIColor {
    
    /// Convert to HSL color
    public func e_toHSL() -> HSLColor {
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
            return HSLColor(hue: h, saturation: s, lightness: l, alpha: a)
        }
        
        let delta = max - min
        s = delta
        
        if (s > 0.0) {
            s = s / ((l <= 0.5) ? (max + min) : (2.0 - max - min))
        } else {
            return HSLColor(hue: h, saturation: s, lightness: l, alpha: a)
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
        
        return HSLColor(hue: h, saturation: s, lightness: l, alpha: a)
    }
    
    /// Init from HSL color
    ///
    /// - Parameter e_hslColor: The HSL color
    public convenience init(e_hslColor hslColor: HSLColor) {
        // https://github.com/thisandagain/color
        
        // Check for saturation.
        // If there isn't any just return the luminance
        // value for each, which results in gray.
        if (hslColor.saturation == 0.0) {
            self.init(
                red: hslColor.lightness,
                green: hslColor.lightness,
                blue: hslColor.lightness,
                alpha: hslColor.alpha
            )
            return
        }
        
        // Test for luminance and compute temporary
        // values based on luminance and saturation
        var temp2: CGFloat
        if (hslColor.lightness < 0.5) {
            temp2 = hslColor.lightness * (1.0 + hslColor.saturation)
        } else {
            temp2 = hslColor.lightness
                + hslColor.saturation
                - hslColor.lightness * hslColor.saturation
        }
        
        let temp1 = 2.0 * hslColor.lightness - temp2
        
        // Compute intermediate values based on hue
        var temp: [CGFloat] = Array(repeatElement(0, count: 3))
        temp[0] = hslColor.hue + 1.0 / 3.0
        temp[1] = hslColor.hue
        temp[2] = hslColor.hue - 1.0 / 3.0
        
        Array(0..<3).forEach { i in
            // Adjust the range
            if (temp[i] < 0.0) {
                temp[i] += 1.0
            }
            
            if (temp[i] > 1.0) {
                temp[i] -= 1.0
            }
            
            if (6.0 * temp[i] < 1.0) {
                temp[i] = temp1 + (temp2 - temp1) * 6.0 * temp[i]
            } else {
                if (2.0 * temp[i] < 1.0) {
                    temp[i] = temp2
                } else {
                    if (3.0 * temp[i] < 2.0) {
                        temp[i] = temp1 + (temp2 - temp1) * ((2.0 / 3.0) - temp[i]) * 6.0
                    } else {
                        temp[i] = temp1
                    }
                }
            }
        }
        
        self.init(red: temp[0], green: temp[1], blue: temp[2], alpha: hslColor.alpha)
    }
}

extension UIColor {
    
    /// Return a random color
    ///
    /// - Returns: A random color
    public static func e_random() -> UIColor {
        let randomHue = CGFloat(arc4random_uniform(UInt32.max)) / CGFloat(UInt32.max)
        
        let hslColor = HSLColor(
            hue: randomHue,
            saturation: 0.5,
            lightness: 0.5,
            alpha: 1
        )
        
        return UIColor(e_hslColor: hslColor)
    }
    
    /// Darken the color
    ///
    /// - Parameter amount: The amount to alter lightness
    /// - Returns: A darkened color
    public func e_darken(amount: CGFloat = 0.2) -> UIColor {
        var hslColor = e_toHSL()
        hslColor.lightness = min(1 - amount, hslColor.lightness - amount)
        
        return UIColor(e_hslColor: hslColor)
    }
    
    /// Lighten the color
    ///
    /// - Parameter amount: The amount to alter lightness
    /// - Returns: A lightened color
    public func e_lighten(amount: CGFloat = 0.2) -> UIColor {
        var hslColor = e_toHSL()
        hslColor.lightness = max(amount, hslColor.lightness + amount)
        
        return UIColor(e_hslColor: hslColor)
    }
}
