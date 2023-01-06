//
//  LWWElement.swift
//  GoodNotesLWW
//
//  Created by Phil Pepper on 22/12/2022.
//

import Foundation

protocol LWWElement: AnyObject, Equatable, Hashable {
    
    associatedtype Key: Hashable
    associatedtype Value: Equatable, Hashable
    
    var key: Key { get }
    var value: Value { get set }
    var timestamp: Date { get }
    
    init(key: Key, value: Value, timestamp: Date)
    
}

extension LWWElement {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.key == rhs.key && lhs.value == lhs.value
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(key)
        hasher.combine(value)
    }
    
}
