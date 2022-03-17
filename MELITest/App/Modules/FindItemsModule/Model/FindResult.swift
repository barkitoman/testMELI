//
//  FindResults.swift
//  MELITest
//
//  Created by Julian Barco on 16/03/22.
//

import Foundation

struct FindResult: Decodable {
    var results: [Item]
    var paging: Pagination
}

struct Item: Decodable{
    var id: String
    var title: String
    var thumbnail: String
    var price: Double
    var originalPrice: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, title, thumbnail, price
        case originalPrice = "original_price"
    }
}

class Pagination: Decodable {
    let total: Int
    let results: Int
    let offset: Int
    let limit: Int
    
    enum CodingKeys: String, CodingKey {
        case total, offset, limit
        case results = "primary_results"
    }
    
    init(total: Int, results: Int, offset: Int, limit: Int) {
        self.total = total
        self.results = results
        self.offset = offset
        self.limit = limit
    }
}
