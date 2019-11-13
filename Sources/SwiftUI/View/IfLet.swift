//
//  IfLet.swift
//  Omnia
//
//  Created by khoa on 13/11/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import SwiftUI

// https://engineering.q42.nl/swiftui-optionals/

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct IfLet<T, Content: View>: View {
    let value: T?
    let build: (T) -> Content

    public init(_ value: T?, build: @escaping (T) -> Content) {
        self.value = value
        self.build = build
    }

    public var body: some View {
        Group {
            if value != nil {
                build(value!)
            }
        }
    }
}
