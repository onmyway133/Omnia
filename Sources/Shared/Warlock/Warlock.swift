//
//  Warlock.swift
//  Omnia
//
//  Created by Khoa Pham on 28/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public struct Warlock {

  public static func swizzleInstance(_ type: AnyClass, original: Selector, swizzled: Selector) {
    swizzle(type, original: original, swizzled: swizzled, methodType: .instance)
  }

  public static func swizzleClass(_ type: AnyClass, original: Selector, swizzled: Selector) {
    swizzle(type, original: original, swizzled: swizzled, methodType: .class)
  }

  // MARK: Block
  public static func swizzleInstance(_ type: AnyClass, original: Selector, block: @escaping () -> Void) {
    swizzle(type, original: original, methodType: .instance, block: block)
  }

  public static func swizzleClass(_ type: AnyClass, original: Selector, block: @escaping () -> Void) {
    swizzle(type, original: original, methodType: .class, block: block)
  }

  enum MethodType {
    case instance
    case `class`
  }

  static func swizzle(_ type: AnyClass, original: Selector, swizzled: Selector, methodType: MethodType) {
    let (originalMethod, swizzledMethod) = methods(type, original: original, swizzled: swizzled, methodType: methodType)

    let didAddMethod = class_addMethod(type, original, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))

    // Is this the right way?
    if didAddMethod {
      class_replaceMethod(type, swizzled, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    } else {
      method_exchangeImplementations(originalMethod, swizzledMethod)
    }
  }

  static func swizzle(_ type: AnyClass, original: Selector, methodType: MethodType, block: @escaping () -> Void) {
    let originalMethod = method(type, original: original, methodType: methodType)
    let castedBlock: AnyObject = unsafeBitCast(block as @convention(block) () -> Void, to: AnyObject.self)
    let swizzledImplementation = imp_implementationWithBlock(castedBlock)

    let didAddMethod = class_addMethod(type, original, swizzledImplementation, method_getTypeEncoding(originalMethod))

    // Is this the right way?
    if didAddMethod {
      class_replaceMethod(type, original, swizzledImplementation, method_getTypeEncoding(originalMethod))
    } else {
      method_setImplementation(originalMethod, swizzledImplementation)
    }
  }

  // MARK: Helper
  static func method(_ type: AnyClass, original: Selector, methodType: MethodType) -> Method {
    switch methodType {
    case .instance:
      return class_getInstanceMethod(type, original)
    case .class:
      return class_getClassMethod(type, original)
    }
  }

  static func methods(_ type: AnyClass, original: Selector, swizzled: Selector, methodType: MethodType) -> (Method, Method) {
    switch methodType {
    case .instance:
      return (class_getInstanceMethod(type, original), class_getInstanceMethod(type, swizzled))
    case .class:
      return (class_getClassMethod(type, original), class_getClassMethod(type, swizzled))
    }
  }
}
