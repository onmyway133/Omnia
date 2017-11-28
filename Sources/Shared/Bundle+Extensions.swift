import Foundation

extension Bundle {

  /// Return application display name
  public var omnia_name: String? {
    return infoDictionary?["CFBundleDisplayName"] as? String
      ?? infoDictionary?["CFBundleName"] as? String
  }

  /// Return the public version number
  public var omnia_versionNumber: String? {
    return infoDictionary?["CFBundleShortVersionString"] as? String
  }

  /// Return build version number
  public var omnia_buildNumber: String? {
    return infoDictionary?["CFBundleVersion"] as? String
  }
}

