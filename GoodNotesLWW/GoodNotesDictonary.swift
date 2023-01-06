//
//  GoodNotesDictonary.swift
//  GoodNotesLWW
//
//  Created by Phil Pepper on 22/12/2022.
//

import Foundation

final class GoodNotesDictionary<K, T>: LWWDictionary where K: Hashable, T: Equatable, T: Hashable {

    typealias Element = GoodNotesElement<K, T>
    
    //MARK: - State
    
    var addSet: Set<Element>
    var removeSet: Set<Element>
    
    //MARK: - Lifecycle
    
    init(
        addSet: Set<Element> = Set<Element>(),
        removeSet: Set<Element> = Set<Element>()
    ) {
        self.addSet = addSet
        self.removeSet = removeSet
    }
    
    //MARK: - Functions
    
    func add(element: Element) {
        addSet = Set(arrayLiteral: element).union(addSet)
    }
    
    func compare(with otherDictionary: GoodNotesDictionary) -> Bool {
        addSet == otherDictionary.addSet && removeSet == otherDictionary.removeSet
    }
    
    func lookUp(element: Element) -> Bool {
        addSet.contains(element) && !removeSet.contains(element)
    }
    
    func merge(with otherDictionary: GoodNotesDictionary) -> GoodNotesDictionary {
        GoodNotesDictionary(
            addSet: addSet.union(otherDictionary.addSet),
            removeSet: removeSet.union(otherDictionary.removeSet)
        )
    }
    
    func remove(element: Element) {
        removeSet = Set(arrayLiteral: element).union(removeSet)
    }
    
    func update(key: K, value: T) {
        let element = addSet.first { $0.key == key }
        element?.value = value
    }
    
}

