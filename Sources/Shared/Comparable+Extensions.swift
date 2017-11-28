import Foundation

extension Comparable {

  /// Check if a number is between 2 numbers
  ///
  /// - Parameters:
  ///   - min: The min number
  ///   - max: The max number
  /// - Returns: True if it is between
  public func omnia_isBetween(min: Self, max: Self) -> Bool {
    return min <= self && self <= max
  }
}
