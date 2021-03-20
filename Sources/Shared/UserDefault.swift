//
//  UserDefaults.swift
//  Omnia
//
//  Created by khoa on 20/03/2021.
//

import Foundation

@propertyWrapper
public struct UserDefault<Value> {
    let key: String
    let defaultValue: Value
    let userDefaults: UserDefaults

    public init(
        key: String,
        defaultValue: Value,
        userDefaults: UserDefaults = .standard
    ) {
        self.key = key
        self.defaultValue = defaultValue
        self.userDefaults = userDefaults
    }

    public var wrappedValue: Value {
        get {
            return userDefaults.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            userDefaults.set(newValue, forKey: key)
        }
    }
}

