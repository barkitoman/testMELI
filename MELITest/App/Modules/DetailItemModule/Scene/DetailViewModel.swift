//
//  DetailViewModel.swift
//  MELITest
//
//  Created by Julian Barco on 18/03/22.
//

import Foundation

class DetailViewModel {
    let detail: DetailItem
    
    init(detail: DetailItem){
        self.detail = detail
    }
    
    var conditionText: String {
        switch detail.condition {
        case .new:
            return "\(detail.soldQuantity) vendidos"
        }
    }
    
    func getPictures(index: Int) -> Picture {
        return detail.pictures[index]
    }
    
    var hasDiscount: Bool {
        if let originalPrice = detail.originalPrice {
            return originalPrice > detail.price
        } else {
            return false
        }
    }
    
    var canPayMercadoPego: Bool {
        return detail.acceptsMercadoPago
    }
    
    var price: String {
        return self.currency(detail.price)
    }
    
    var discount: String {
        let originalPrice = detail.originalPrice ?? 0
        let discount = originalPrice==0 ? 0 :Int(100 - (detail.price * 100 / originalPrice))
        return "% \(discount) OFF"
    }
    
    var originalPrice: String {
        let originalPrice = detail.originalPrice ?? 0
        return self.currency(originalPrice)
    }
    
    func currency(_ price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: price as NSNumber)!
    }
    
}
