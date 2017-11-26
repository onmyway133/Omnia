import Foundation

extension String {

  /// Return a new string with first letter being capitalized
  public var omnia_capitalizedFirstLetter: String {
    guard !isEmpty else {
      return ""
    }

    return "\(prefix(1).uppercased())\(dropFirst())"
  }
}
