//
//  JSON.swift
//  Omnia
//
//  Created by khoa on 12/09/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import Foundation

public func resolve<T>(_ jsonDictionary: [String: Any], keyPath: String) -> T? {
    var current: Any? = jsonDictionary

    keyPath.split(separator: ".").forEach { component in
        if let maybeInt = Int(component), let array = current as? Array<Any> {
            current = array[maybeInt]
        } else if let dictionary = current as? JSONDictionary {
            current = dictionary[String(component)]
        }
    }

    return current as? T
}
