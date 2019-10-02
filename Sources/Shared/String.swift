//
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import Foundation

public extension String {
    /// Return a new string with first letter being capitalized
    var capitalizedFirstLetter: String {
        guard !isEmpty else {
            return ""
        }
        
        return "\(prefix(1).uppercased())\(dropFirst())"
    }
    
    /// Return a localized string using NSLocalizedString
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    func toData() -> Data {
        return Data(self.utf8)
    }

    var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func hasPattern(regex: String) -> Bool {
        return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }

    func containsIgnoringCase(_ find: String) -> Bool {
        return self.range(of: find, options: .caseInsensitive) != nil
    }

    func trimmingInside(start: String, end: String) -> String {
        return self.replacingOccurrences(of: "\\s?\\\(start)[\\w\\s]*\\\(end)", with: "", options: .regularExpression)
    }
}
