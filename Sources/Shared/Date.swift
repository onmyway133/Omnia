//
//  Date.swift
//  Omnia
//
//  Created by khoa on 11/04/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import Foundation

public extension Date {

    func second(calendar: Calendar = .current) -> Int {
        return calendar.component(.second, from: self)
    }
    
    func minute(calendar: Calendar = .current) -> Int {
        return calendar.component(.minute, from: self)
    }
    
    func hour(calendar: Calendar = .current) -> Int {
        return calendar.component(.hour, from: self)
    }
    
    func day(calendar: Calendar = .current) -> Int{
        return calendar.component(.day, from: self)
    }
    
    func month(calendar: Calendar = .current) -> Int {
        return calendar.component(.month, from: self)
    }
    
    func year(calendar: Calendar = .current) -> Int {
        return calendar.component(.year, from: self)
    }
    
    func weekday(calendar: Calendar = .current) -> Int {
        return calendar.component(.weekday, from: self)
    }
}
