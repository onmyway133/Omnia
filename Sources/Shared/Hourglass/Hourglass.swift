//
//  Hourglass.swift
//  Omnia
//
//  Created by Khoa Pham on 28/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public struct Hourglass {
  
  public static func schedule(seconds: NSTimeInterval,
                       repeats: Bool, tolerance: NSTimeInterval = 0, action: () -> Void) -> NSTimer {

    let timer = NSTimer.scheduledTimerWithTimeInterval(seconds,
                                                       target: Target(action: action),
                                                       selector: #selector(Target.fire), userInfo: nil, repeats: repeats)
    timer.tolerance = tolerance

    return timer
  }

  public static func every(seconds: NSTimeInterval, action: () -> Void) -> NSTimer {
    return schedule(seconds, repeats: true, action: action)
  }

  public static func after(seconds: NSTimeInterval, action: () -> Void) -> NSTimer {
    return schedule(seconds, repeats: false, action: action)
  }
}
