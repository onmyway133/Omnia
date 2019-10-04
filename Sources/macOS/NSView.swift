//
//  NSView+Extensions.swift
//  Omnia-macOS
//
//  Created by Khoa Pham on 21.12.2017.
//  Copyright © 2017 Khoa Pham. All rights reserved.
//

import AppKit

public extension NSView {
    /// Add many subviews
    ///
    /// - Parameter views: The subviews
    func addSubviews(_ views: [NSView]) {
        views.forEach {
            addSubview($0)
        }
    }

    func shake() {
        let midX = layer?.position.x ?? 0
        let midY = layer?.position.y ?? 0

        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.06
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: midX - 10, y: midY)
        animation.toValue = CGPoint(x: midX + 10, y: midY)
        layer?.add(animation, forKey: "position")
    }

    static var itemId: NSUserInterfaceItemIdentifier {
        return NSUserInterfaceItemIdentifier(rawValue: String(describing: self))
    }

    func scaleDown(scale: CGFloat = 0.95) {
        wantsLayer = true
        let frame = layer!.frame
        layer?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        layer?.frame = frame

        let animation = CABasicAnimation(keyPath: "transform")
        animation.duration = 0.25
        animation.repeatCount = 1
        animation.autoreverses = false
        animation.fromValue = CATransform3DMakeScale(1.0, 1.0, 1.0)
        animation.toValue = CATransform3DMakeScale(scale, scale, 1.0)
        layer?.add(animation, forKey: "scale")
    }
}
