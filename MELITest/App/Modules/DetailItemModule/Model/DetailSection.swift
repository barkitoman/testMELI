//
//  DetailSection.swift
//  MELITest
//
//  Created by Julian Barco on 18/03/22.
//

import Foundation

class DetailSection: Hashable {
    var id: String = UUID().uuidString
    var items: [DetailSectionItem]
    
    init(items: [DetailSectionItem]) {
        self.items = items
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: DetailSection, rhs: DetailSection) -> Bool {
        false
    }
}
