import Foundation

public struct Math {

  public static func isPrime(number: Int) -> Bool {
    guard number > 2 else {
      return false
    }

    for i in 2..<number {
      if number % i == 0 {
        return false
      }
    }

    return true
  }

  public static func greatestCommonDivisor(a: Int, b: Int) -> Int {
    guard a != 0 && b != 0 else {
      return a + b
    }

    return greatestCommonDivisor(a: a, b: a % b)
  }
}
