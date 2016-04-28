//
//  Warlock.swift
//  Omnia
//
//  Created by Khoa Pham on 28/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public struct Warlock {

  public static func swizzleInstance(type: AnyClass, original: Selector, swizzled: Selector) {
    swizzle(type, original: original, swizzled: swizzled, methodType: .Instance)
  }

  public static func swizzleClass(type: AnyClass, original: Selector, swizzled: Selector) {
    swizzle(type, original: original, swizzled: swizzled, methodType: .Class)
  }

  // MARK: Block
  public static func swizzleInstance(type: AnyClass, original: Selector, block: () -> Void) {
    swizzle(type, original: original, methodType: .Instance, block: block)
  }

  public static func swizzleClass(type: AnyClass, original: Selector, block: () -> Void) {
    swizzle(type, original: original, methodType: .Class, block: block)
  }

  enum MethodType {
    case Instance
    case Class
  }

  static func swizzle(type: AnyClass, original: Selector, swizzled: Selector, methodType: MethodType) {
    let (originalMethod, swizzledMethod) = methods(type, original: original, swizzled: swizzled, methodType: methodType)

    let didAddMethod = class_addMethod(type, original, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))

    // Is this the right way?
    if didAddMethod {
      class_replaceMethod(type, swizzled, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    } else {
      method_exchangeImplementations(originalMethod, swizzledMethod)
    }
  }

  static func swizzle(type: AnyClass, original: Selector, methodType: MethodType, block: () -> Void) {
    let originalMethod = method(type, original: original, methodType: methodType)
    let castedBlock: AnyObject = unsafeBitCast(block as @convention(block) () -> Void, AnyObject.self)
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
  static func method(type: AnyClass, original: Selector, methodType: MethodType) -> Method {
    switch methodType {
    case .Instance:
      return class_getInstanceMethod(type, original)
    case .Class:
      return class_getClassMethod(type, original)
    }
  }

  static func methods(type: AnyClass, original: Selector, swizzled: Selector, methodType: MethodType) -> (Method, Method) {
    switch methodType {
    case .Instance:
      return (class_getInstanceMethod(type, original), class_getInstanceMethod(type, swizzled))
    case .Class:
      return (class_getClassMethod(type, original), class_getClassMethod(type, swizzled))
    }
  }
}
