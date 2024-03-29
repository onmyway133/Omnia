//
//  UXImage.swift
//  Omnia
//
//  Created by khoa on 15/09/2021.
//

#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif

import ImageIO

public extension UXImage {
    /// Using ImageIO
    static func downsampled(
        at url: URL,
        size: CGSize,
        shouldCacheImmediately: Bool = true
    ) -> UXImage? {
        // Create an CGImageSource that represent an image
        let imageSourceOptions = [
            kCGImageSourceShouldCache: false
        ] as CFDictionary

        guard
            let imageSource = CGImageSourceCreateWithURL(url as CFURL, imageSourceOptions)
        else {
            return nil
        }

        let scale: CGFloat
        #if canImport(AppKit)
        scale = NSScreen.main?.backingScaleFactor ?? 1
        #else
        scale = UIScreen.main.scale
        #endif

        let maxDimensionInPixels = max(size.width, size.height) * scale

        let downsampleOptions = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceShouldCacheImmediately: shouldCacheImmediately,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceThumbnailMaxPixelSize: maxDimensionInPixels
        ] as CFDictionary

        guard let downsampledImage = CGImageSourceCreateThumbnailAtIndex(
            imageSource, 0, downsampleOptions
        ) else {
            return nil
        }

        #if canImport(AppKit)
        return NSImage(cgImage: downsampledImage, size: size)
        #else
        return UIImage(cgImage: downsampledImage)
        #endif
    }

    func scaledSize(targetSize: CGSize) -> CGSize {
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let scaleFactor = min(widthRatio, heightRatio)
        return CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )
    }
}

