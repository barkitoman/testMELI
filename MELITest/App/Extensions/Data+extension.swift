//
//  Data+extension.swift
//  MELITest
//
//  Created by Julian Barco on 16/03/22.
//
import Foundation

extension Data {
    func toString() -> String {
        return String(data: self, encoding: .utf8)!
    }
    
    func convertToObject<T: Decodable>(using modelType: T.Type) -> T? {
        return (try? JSONDecoder().decode(T.self, from: self))
    }
}
