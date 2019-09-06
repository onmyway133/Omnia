import Foundation

public func with<A, B>(_ op1: A?, _ op2: B?, _ closure: (A, B) -> Void) {
    if let value1 = op1, let value2 = op2 {
        closure(value1, value2)
    }
}

public func withObject<T>(_ value: T, closure: (T) -> Void) -> T {
    closure(value)
    return value
}

public func withValue<T>(_ value: T, closure: (inout T) -> Void) -> T {
    var mutableValue = value
    closure(&mutableValue)
    return mutableValue
}
