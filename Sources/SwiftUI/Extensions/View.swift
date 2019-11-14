//
//  View.swift
//  Omnia
//
//  Created by khoa on 29/10/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(SwiftUI)

import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public extension View {
    func embedInScrollView(alignment: Alignment = .center) -> some View {
        GeometryReader { proxy in
            ScrollView {
                self.frame(
                    minHeight: proxy.size.height,
                    maxHeight: .infinity,
                    alignment: alignment
                )
            }
        }
    }

    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }

    func styleMultiline() -> some View {
        return self
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
    }
}

#endif
