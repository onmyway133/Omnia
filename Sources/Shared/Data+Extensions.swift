import Foundation

extension Data {
    
    /// Convert to hex string
    public var e_hexString: String {
        return map({ String(format: "%02hhx", $0) }).joined()
    }
}
