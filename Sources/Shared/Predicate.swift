//
//  Predicate.swift
//  
//
//  Created by khoa on 11/11/2021.
//

import Foundation

public extension NSPredicate {
    static func and(_ predicates: [NSPredicate]) -> NSPredicate {
        NSCompoundPredicate(type: .and, subpredicates: predicates)
    }

    static func or(_ predicates: [NSPredicate]) -> NSPredicate {
        NSCompoundPredicate(type: .or, subpredicates: predicates)
    }

    static func not(_ predicates: [NSPredicate]) -> NSPredicate {
        NSCompoundPredicate(type: .not, subpredicates: predicates)
    }

    static func compare<Root, V>(
        _ kp: KeyPath<Root, V>,
        op: NSComparisonPredicate.Operator,
        value: Any
    ) -> NSPredicate {
        let ex1 = \Root.self == kp
            ? NSExpression.expressionForEvaluatedObject()
            : NSExpression(forKeyPath: kp)
        let ex2 = NSExpression(forConstantValue: value)

        return NSComparisonPredicate(
            leftExpression: ex1,
            rightExpression: ex2,
            modifier: .direct,
            type: op
        )
    }
}

public extension NSPredicate {
    static func isTrue<Root, V>(
        _ kp: KeyPath<Root, V>
    ) -> NSPredicate {
        compare(kp, op: .equalTo, value: true)
    }

    static func isFalse<Root, V>(
        _ kp: KeyPath<Root, V>
    ) -> NSPredicate {
        compare(kp, op: .equalTo, value: false)
    }

    static func isNil<Root, V>(
        _ kp: KeyPath<Root, V>
    ) -> NSPredicate {
        compare(kp, op: .equalTo, value: NSNull())
    }

    static func isNotNil<Root, V>(
        _ kp: KeyPath<Root, V>
    ) -> NSPredicate {
        compare(kp, op: .notEqualTo, value: NSNull())
    }
}
