//
//  ActivittyIndicator.swift
//  Omnia
//
//  Created by khoa on 02/11/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(UIKit) && os(iOS)

import SwiftUI

@available(iOS 13.0, *)
public struct ActivityIndicator: UIViewRepresentable {
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    public func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

#endif
