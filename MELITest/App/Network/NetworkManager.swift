//
//  NetworkManager.swift
//  MELITest
//
//  Created by Julian Barco on 14/03/22.
//

import Foundation

class NetworkManager {
    private let baseUrl: String
    private static var shared: NetworkManager?
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    static func provideBaseUrl(_ baseUrl: String) {
        self.shared = NetworkManager(baseUrl: baseUrl)
    }
    
    static func sharedInstance() throws -> NetworkManager {
        if shared != nil {
            return shared!
        } else {
            throw NetworkError.baseUrlNotProvided
        }
    }
    
    func request(method: NetworkMethod, path: String = "", params: [String: Any]? = nil, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: self.baseUrl + path) else {
            completion(nil, NetworkError.badUrl)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let params = params {
            var components = URLComponents()
            var items = [URLQueryItem]()
            
            for (key, value) in params {
                let item = URLQueryItem(name: key, value: "\(value)")
                items.append(item)
            }
            components.queryItems = items
            request.url = URL(string: request.url!.absoluteString + components.url!.absoluteString)
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                Log.d("Network manager: unknown error: \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse, !(200..<300).contains(response.statusCode) {
                Log.d("Network manager: status code error has occured!")
                completion(nil, NetworkError.statusCode(response.statusCode ))
                return
            }
            
            if let data = data {
                completion(data, nil)
                return
            }
        }.resume()
    }
}
