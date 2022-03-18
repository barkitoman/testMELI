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
}
