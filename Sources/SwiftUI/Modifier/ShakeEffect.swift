//
//  ShakeEffect.swift
//  Omnia
//
//  Created by khoa on 14/11/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(SwiftUI)

import SwiftUI

// https://learntalks.com/FrenchKit/2019/FrenchKit-2019-Animations-with-SwiftUI-Chris-Eidhof/

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ShakeEffect: GeometryEffect {
    var position: CGFloat = 0

    public var animatableData: CGFloat {
        get { position }
        set { position = newValue }
    }

    public func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(
            CGAffineTransform(translationX: sin(position * 2 * .pi), y: 0)
        )
    }
}

#endif
