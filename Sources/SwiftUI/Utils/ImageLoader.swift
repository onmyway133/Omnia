//
//  ImageLoader.swift
//  Omnia
//
//  Created by khoa on 29/10/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(Combine)

import Combine
import Foundation

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
class ImageLoader: ObservableObject {
    private var cancellable: AnyCancellable?
    let objectWillChange = PassthroughSubject<UXImage?, Never>()

    func load(url: URL) {
        self.cancellable = URLSession.shared
            .dataTaskPublisher(for: url)
            .map({ $0.data })
            .map({ UXImage(data: $0) })
            .receive(on: RunLoop.main)
            .replaceError(with: nil)
            .eraseToAnyPublisher()
            .sink(receiveValue: { image in
                self.objectWillChange.send(image)
            })
    }

    func cancel() {
        cancellable?.cancel()
    }
}

#endif
