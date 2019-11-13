//
//  Redux.swift
//  Omnia
//
//  Created by khoa on 13/11/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import Combine
import Foundation

public struct Reducer<State, Mutation> {
    let reduce: (inout State, Mutation) -> Void
}

@available(iOS 13.0, *)
public protocol Action {
    associatedtype Mutation
    func toMutation() -> AnyPublisher<Mutation, Never>
}

@available(iOS 13.0, *)
public final class Store<State, Mutation>: ObservableObject {
    @Published public private(set) var state: State
    public let reducer: Reducer<State, Mutation>
    public private(set) var cancellables = Set<AnyCancellable>()

    public init(initialState: State, reducer: Reducer<State, Mutation>) {
        self.state = initialState
        self.reducer = reducer
    }

    public func send<A: Action>(action: A) where A.Mutation == Mutation {
        action
            .toMutation()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: update(mutation:))
            .store(in: &cancellables)
    }

    public func update(mutation: Mutation) {
        reducer.reduce(&state, mutation)
    }
}
