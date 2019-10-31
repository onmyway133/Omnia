//
//  Text.swift
//  Omnia
//
//  Created by khoa on 31/10/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import SwiftUI

public extension Text {
    func styleMultiline() -> some View {
        return self
        .lineLimit(nil)
        .fixedSize(horizontal: false, vertical: true)
    }
}
