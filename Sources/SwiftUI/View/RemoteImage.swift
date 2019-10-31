//
//  RemoteImage.swift
//  Omnia
//
//  Created by khoa on 29/10/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct RemoteImage: View {
    @State var image: UXImage? = nil
    
    private let url: URL
    private let imageLoader = ImageLoader()
    private let placeholderView: AnyView

    init(url: URL,  placeholderView: AnyView) {
        self.url = url
        self.placeholderView = placeholderView
    }

    var body: some View {
        Group {
            makeContent()
        }
        .onReceive(imageLoader.objectWillChange, perform: { image in
            self.image = image
        })
        .onAppear(perform: {
            self.imageLoader.load(url: self.url)
        })
        .onDisappear(perform: {
            self.imageLoader.cancel()
        })
    }

    private func makeContent() -> some View {
        if let image = image {
            return makeImage(image: image)
                .styleFit()
                .eraseToAnyView()
        } else {
            return placeholderView
        }
    }

    private func makeImage(image: UXImage) -> Image {
        #if canImport(UIKit)
            return Image(uiImage: image)
        #elseif canImport(AppKit)
            return Image(nsImage: image)
        #else
            return Image(uiImage: image)
        #endif
    }
}
