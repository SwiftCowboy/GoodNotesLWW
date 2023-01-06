//
//  GoodNotesLWWTests.swift
//  GoodNotesLWWTests
//
//  Created by Phil Pepper on 20/12/2022.
//

import XCTest
@testable import GoodNotesLWW

final class GoodNotesLWWTests: XCTestCase {

    func testAdd() {
        let goodNotesDictionary = GoodNotesDictionary<String, Dog>()
        let goodNotesElement = GoodNotesElement<String, Dog>(
            key: "Bubba",
            value: Dog(name: "Bubba", age: 2)
        )
        
        XCTAssertTrue(
            goodNotesDictionary.addSet.isEmpty,
            "AddSet should be emtpy"
        )
        
        goodNotesDictionary.add(element: goodNotesElement)
        XCTAssertTrue(
            goodNotesDictionary.addSet.count == 1,
            "AddSet should contain one element"
        )
        
        goodNotesDictionary.add(element: goodNotesElement)
        XCTAssertTrue(
            goodNotesDictionary.addSet.count == 1,
            "AddSet should not contain duplicate elements"
        )
    }
    
    func testRemove() {
        let goodNotesDictionary = GoodNotesDictionary<String, Dog>()
        let goodNotesElement = GoodNotesElement<String, Dog>(
            key: "Bubba",
            value: Dog(name: "Bubba", age: 2)
        )
        
        XCTAssertTrue(
            goodNotesDictionary.removeSet.isEmpty,
            "RemoveSet should be emtpy"
        )
        
        goodNotesDictionary.remove(element: goodNotesElement)
        XCTAssertTrue(
            goodNotesDictionary.removeSet.count == 1,
            "RemoveSet should contain one item"
        )

        goodNotesDictionary.remove(element: goodNotesElement)
        XCTAssertTrue(
            goodNotesDictionary.removeSet.count == 1,
            "RemoveSet should not contain duplicate elements"
        )
    }

    
    func testLookUp() {
        let goodNotesDictionary = GoodNotesDictionary<String, Dog>()
        let goodNotesElement = GoodNotesElement<String, Dog>(
            key: "Bubba",
            value: Dog(name: "Bubba", age: 2)
        )
        
        goodNotesDictionary.add(element: goodNotesElement)
        XCTAssertTrue(
          goodNotesDictionary.lookUp(element: goodNotesElement),
          "The element should be found in addSet"
        )
        
        goodNotesDictionary.remove(element: goodNotesElement)
        XCTAssertFalse(
            goodNotesDictionary.lookUp(element: goodNotesElement),
            "The element should be found in addSet but not also in removeSet"
        )
    }
    
    func testCompare() {
        let firstDictionary = GoodNotesDictionary<String, Dog>()
        let secondDictionary = GoodNotesDictionary<String, Dog>()
        let thridDictionary = GoodNotesDictionary<String, Dog>()
        
        firstDictionary.add(
            element: GoodNotesElement(
                key: "Bubba",
                value: Dog(name: "Bubba", age: 2)
            )
        )
        
        firstDictionary.remove(
            element: GoodNotesElement(
                key: "Alexander",
                value: Dog(name: "Alexander", age: 4)
            )
        )
        
        secondDictionary.add(
            element: GoodNotesElement(
                key: "Russel",
                value: Dog(name: "Russel", age: 5)
            )
        )
        
        secondDictionary.remove(
            element: GoodNotesElement(
                key: "Sally",
                value: Dog(name: "Sally", age: 7)
            )
        )
        
        thridDictionary.add(
            element: GoodNotesElement(
                key: "Bubba",
                value: Dog(name: "Bubba", age: 2)
            )
        )
        
        thridDictionary.remove(
            element: GoodNotesElement(
                key: "Alexander",
                value: Dog(name: "Alexander", age: 4)
            )
        )
        
        XCTAssertTrue(
            firstDictionary == thridDictionary,
            "The first and thrid dictionaries should be equivalent"
        )
        
        XCTAssertFalse(
            firstDictionary == secondDictionary,
            "The first and second dictionaries are not equivalent"
        )
        
    }

    func testMerge() {
        let firstDictionary = GoodNotesDictionary<String, Dog>()
        let secondDictionary = GoodNotesDictionary<String, Dog>()
        
        firstDictionary.add(
            element: GoodNotesElement(
                key: "Bubba",
                value: Dog(name: "Bubba", age: 2)
            )
        )
        
        firstDictionary.remove(
            element: GoodNotesElement(
                key: "Alexander",
                value: Dog(name: "Alexander", age: 4)
            )
        )
        
        secondDictionary.add(
            element: GoodNotesElement(
                key: "Russel",
                value: Dog(name: "Russel", age: 5)
            )
        )
        
        secondDictionary.remove(
            element: GoodNotesElement(
                key: "Sally",
                value: Dog(name: "Sally", age: 7)
            )
        )
        
        let mergeResult = firstDictionary + secondDictionary
        XCTAssertTrue(
            mergeResult.addSet.count == 2,
            "The merged dictionary should contain 2 items in the addSet"
        )
        
        XCTAssertTrue(
            mergeResult.removeSet.count == 2,
            "The merged dictionary should contain 2 items in the removeSet"
        )
    }
    
    func testUpdate() {
        let goodNotesDictionary = GoodNotesDictionary<String, Dog>()
        let goodNotesElement = GoodNotesElement<String, Dog>(
            key: "Bubba",
            value: Dog(name: "Bubba", age: 2)
        )
        
        goodNotesDictionary.add(element: goodNotesElement)
        XCTAssertTrue(
            goodNotesDictionary.addSet.first?.value.age == 2,
            "The age of the Dog should intially be 2"
        )
        
        goodNotesDictionary.update(
            key: "Bubba",
            value: Dog(name: "Bubba", age: 3)
        )
        
        XCTAssertTrue(
            goodNotesDictionary.addSet.first?.value.age == 3,
            "The age of the Dog should have changed from 2 to 3"
        )
    }
    
}
