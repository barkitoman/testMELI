//
//  FindItemsViewModel.swift
//  MELITest
//
//  Created by Julian Barco on 16/03/22.
//

import Foundation

class FindItemsViewModel {
    
    var item: Item
    
    init(item: Item){
        self.item = item
    }
    
    var hasDiscount: Bool {
        if let originalPrice = item.originalPrice {
            return originalPrice > item.price
        } else {
            return false
        }
    }
    
    var discount: String {
        let originalPrice = item.originalPrice ?? 0
        let discount = Int(100 - (item.price * 100 / originalPrice))
        return "% \(discount) OFF"
    }
    
    func getPrice() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: item.price as NSNumber)!
    }
    
}
