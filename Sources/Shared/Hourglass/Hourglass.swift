//
//  Hourglass.swift
//  Omnia
//
//  Created by Khoa Pham on 28/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public struct Hourglass {

  public static func schedule(_ seconds: TimeInterval,
                       repeats: Bool, tolerance: TimeInterval = 0, action: @escaping () -> Void) -> Timer {

    let timer = Timer.scheduledTimer(timeInterval: seconds,
                                                       target: Target(action: action),
                                                       selector: #selector(Target.fire), userInfo: nil, repeats: repeats)
    timer.tolerance = tolerance

    return timer
  }

  public static func every(_ seconds: TimeInterval, action: @escaping () -> Void) -> Timer {
    return schedule(seconds, repeats: true, action: action)
  }

  public static func after(_ seconds: TimeInterval, action: @escaping () -> Void) -> Timer {
    return schedule(seconds, repeats: false, action: action)
  }
}
