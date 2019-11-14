//
//  CustomFont.swift
//  Omnia
//
//  Created by khoa on 14/11/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(UIKit) && canImport(SwiftUI)

import SwiftUI

// https://learntalks.com/Pragma-Mark/2019/Pragma-Mark-2019-Pragma-Conference-2019-Paul-Hudson-SwiftUI-Everywhere/

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
public struct CustomFont: ViewModifier {

    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    public func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

#endif
