//
//  FindItem.swift
//  MELITest
//
//  Created by Julian Barco on 17/03/22.
//

import Foundation

class FindItem: Hashable {
    var id: String = UUID().uuidString
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: FindItem, rhs: FindItem) -> Bool {
        false
    }
}

class FindItemApply: FindItem {
    let viewModel: FindItemsViewModel
    
    init(viewModel: FindItemsViewModel){
        self.viewModel = viewModel
        super.init()
    }
}

class FindItemLoading: FindItem {
    
}
