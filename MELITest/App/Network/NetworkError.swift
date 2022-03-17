//
//  NetworkError.swift
//  MELITest
//
//  Created by Julian Barco on 14/03/22.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case baseUrlNotProvided
    case statusCode(Int)
    case invalidServerResponse
    case errorHandler(message: String)
    
  
}

