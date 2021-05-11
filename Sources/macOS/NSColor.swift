//
//  NSColor+Extensions.swift
//  Omnia-macOS
//
//  Created by Khoa Pham on 21.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

#if os(OSX) && !targetEnvironment(macCatalyst)

import AppKit

public extension NSColor {
    
    /// Init color from hex string
    ///
    /// - Parameter hex: A hex string, with or without #
    convenience init(hex: String) {
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

    convenience init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )

        self.init(
            red: CGFloat(components.R),
            green: CGFloat(components.G),
            blue: CGFloat(components.B),
            alpha: CGFloat(alpha)
        )
    }
}

#endif
