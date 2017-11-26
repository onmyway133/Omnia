import Foundation

extension Optional {

  /// Unwrap with message
  ///
  /// - Parameter message: A message to give more info
  public func omnia_unwrap(message: String) -> Wrapped {
    if let value = self {
      return value
    } else {
      fatalError(message)
    }
  }
}

extension Optional where Wrapped == String {

  /// Return true if it is not nil and not empty
  public var omnia_isPresent: Bool {
    if let value = self {
      return !value.isEmpty
    } else {
      return false
    }
  }
}
