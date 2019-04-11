import Foundation

/// Add-on utitlies to all types
/// https://github.com/JetBrains/kotlin/blob/master/libraries/stdlib/src/kotlin/util/Standard.kt
public protocol TypeAddOnAware {}

public extension TypeAddOnAware {
    /// Calls the specified closure with this instance as its receiver
    /// and returns this instance
    ///
    /// - Parameter closure: The closure to apply
    func e_apply(closure: (Self) -> Void) {
        closure(self)
    }
}

/// Conform NSObject by default
extension NSObject : TypeAddOnAware {}
