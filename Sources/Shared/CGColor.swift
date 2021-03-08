//
//  CGColor.swift
//  Omnia
//
//  Created by khoa on 08/03/2021.
//


import CoreGraphics

public extension CGColor {
    func isLight(threshold: Float = 0.7) -> Bool {
        let RGBCGColor = converted(
            to: CGColorSpaceCreateDeviceRGB(),
            intent: .defaultIntent,
            options: nil
        )

        guard
            let components = RGBCGColor?.components,
            components.count >= 3
        else {
            return false
        }

        let brightness = Float(
            ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
        )

        return (brightness > threshold)
    }
}
