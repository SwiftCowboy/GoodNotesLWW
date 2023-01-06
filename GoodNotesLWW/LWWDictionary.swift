//
//  LWWDictionary.swift
//  GoodNotesLWW
//
//  Created by Phil Pepper on 22/12/2022.
//

import Foundation

protocol LWWDictionary: AnyObject, Equatable {
    
    associatedtype Element: LWWElement
    
    var addSet: Set<Element> { get set }
    var removeSet: Set<Element> { get set }
    
    init(addSet: Set<Element>, removeSet: Set<Element>)
    
    func add(element: Element)
    func compare(with otherDictionary: Self) -> Bool
    func lookUp(element: Element) -> Bool
    func merge(with otherDictionary: Self) -> Self
    func remove(element: Element)
    func update(key: Element.Key, value: Element.Value)
    
}

extension LWWDictionary {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.compare(with: rhs)
    }
    
    static func + (lhs: Self, rhs: Self) -> Self {
        lhs.merge(with: rhs)
    }
    
}
