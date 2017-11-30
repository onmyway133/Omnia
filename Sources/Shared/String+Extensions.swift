import Foundation

extension String {

  /// Return a new string with first letter being capitalized
  public var e_capitalizedFirstLetter: String {
    guard !isEmpty else {
      return ""
    }

    return "\(prefix(1).uppercased())\(dropFirst())"
  }

  /// Return a localized string using NSLocalizedString
  public var e_localized: String {
    return NSLocalizedString(self, comment: "")
  }
}
