import Foundation

extension Sequence {

  /// Shuffle sequence by creating a new array
  ///
  /// - Returns: Shuffled array
  public func e_shuffled() -> [Element] {
    var array = Array(self)

    guard array.count > 1 else {
      return array
    }

    let count = array.count
    for i in 0..<(array.count - 1) {
      let j = Int(arc4random_uniform(UInt32(count - i))) + i
      array.swapAt(i, j)
    }

    return array
  }
}
