//
//  ItemDetail.swift
//  MELITest
//
//  Created by Julian Barco on 18/03/22.
//

import Foundation

struct DetailItem: Decodable {
    var id: String
    var title: String
    var condition: Condition
    var soldQuantity: Int
    var pictures: [Picture]
    var price: Double
    var originalPrice: Double?
    var permalink: String
    var acceptsMercadoPago: Bool
    var warranty: String
    
    enum ContainerCodingKeys: CodingKey {
        case body
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, condition, pictures, price, permalink, warranty
        case acceptsMercadoPago = "accepts_mercadopago"
        case soldQuantity = "sold_quantity"
        case originalPrice = "original_price"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContainerCodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .body)
        
        id = try dataContainer.decode(String.self, forKey: .id)
        title = try dataContainer.decode(String.self, forKey: .title)
        condition = try dataContainer.decode(Condition.self, forKey: .condition)
        pictures = try dataContainer.decode([Picture].self, forKey: .pictures)
        soldQuantity = try dataContainer.decode(Int.self, forKey: .soldQuantity)
        price = try dataContainer.decode(Double.self, forKey: .price)
        originalPrice = try dataContainer.decodeIfPresent(Double.self, forKey: .originalPrice)
        permalink = try dataContainer.decode(String.self, forKey: .permalink)
        acceptsMercadoPago = try dataContainer.decode(Bool.self, forKey: .acceptsMercadoPago)
        warranty = try dataContainer.decode(String.self, forKey: .warranty)
    }
    
    init(id: String, title: String, condition: Condition, pictures: [Picture], soldQuantity: Int, price: Double, originalPrice: Double?, permalink: String,acceptsMercadoPago: Bool, warranty:String) {
        self.id = id
        self.title = title
        self.condition = condition
        self.pictures = pictures
        self.soldQuantity = soldQuantity
        self.price = price
        self.originalPrice = originalPrice
        self.permalink = permalink
        self.acceptsMercadoPago = acceptsMercadoPago
        self.warranty = warranty
    }
}

enum Condition: String, Decodable {
    case new = "new"
}

struct Picture: Decodable {
    let url:String
}
