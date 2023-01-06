//
//  Dog.swift
//  GoodNotesLWW
//
//  Created by Phil Pepper on 22/12/2022.
//

import Foundation

struct Dog: Equatable, Hashable {
    
    let name: String
    let age: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(age)
    }
    
}
