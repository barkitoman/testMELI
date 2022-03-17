//
//  FindSection.swift
//  MELITest
//
//  Created by Julian Barco on 17/03/22.
//

import Foundation

class FindSection: Hashable {
    var id: String = UUID().uuidString
    var items: [FindItem]
    
    init(items: [FindItem]){
        self.items = items
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: FindSection, rhs: FindSection) -> Bool {
        false
    }
}
