//
//  GoodNotesElement.swift
//  GoodNotesLWW
//
//  Created by Phil Pepper on 22/12/2022.
//

import Foundation

final class GoodNotesElement<K, T>: LWWElement where K: Hashable, T: Equatable, T: Hashable {

    typealias Key = K
    typealias Value = T
    
    var key: K
    var value: T
    var timestamp: Date
    
    init(key: K, value: T, timestamp: Date = Date()) {
        self.key = key
        self.value = value
        self.timestamp = timestamp
    }
    
}
