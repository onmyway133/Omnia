//
//  NSImage.swift
//  Omnia-macOS
//
//  Created by khoa on 12/09/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if os(OSX) && !targetEnvironment(macCatalyst)

import AppKit

public extension NSImage {
    func tint(color: NSColor) -> NSImage {
        let image = self.copy() as! NSImage
        image.lockFocus()

        color.set()
        let imageRect = NSRect(origin: .zero, size: image.size)
        imageRect.fill(using: .sourceAtop)

        image.unlockFocus()

        return image
    }

    func resizedPropotionally(
        targetSize: CGSize,
        imageInterpolation: NSImageInterpolation = .high
    ) -> NSImage {
        let scaledSize = self.scaledSize(targetSize: targetSize)
        let img = NSImage(size: scaledSize)
        img.lockFocus()
        NSGraphicsContext.current?.imageInterpolation = imageInterpolation
        draw(
            in: NSRect(origin: .zero, size: scaledSize),
            from: NSRect(origin: .zero, size: size),
            operation: .copy,
            fraction: 1
        )
        img.unlockFocus()
        return img
    }
}

#endif
