//
//  Date.swift
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import Foundation

public extension Date {

    var second: Int {
        return Calendar.current.component(.second, from: self)
    }
    
    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }
    
    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
    
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
}
