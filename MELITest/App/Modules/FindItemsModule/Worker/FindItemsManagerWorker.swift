//
//  FindItemsManagerWorker.swift
//  MELITest
//
//  Created by Julian Barco on 16/03/22.
//

import Foundation
import RxSwift


//sourcery: AutoMockable
protocol FindItemsWorker {
    func getArticles(from query: String, offset: Int, limit: Int) -> Single<FindResult>
}

class FindItemsManagerWorker: FindItemsWorker {
    
    func getArticles(from query: String, offset: Int, limit: Int) -> Single<FindResult> {
        Log.d("worker: searching query: '\(query)'")
        return Single.create { single in
            let disposable = Disposables.create()
            
            let manager: NetworkManager
            do {
                manager = try NetworkManager.sharedInstance()
            } catch {
                single(.failure(error))
                return disposable
            }
            
            manager.request(method: NetworkMethod.get, path: ApiService.searchUrl, params: ["q": query, "offset": "\(offset)", "limit": "\(limit)"]) { data, error in
                if let error = error {
                    single(.failure(error))
                    return
                }
                
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(FindResult.self, from: data)
                        single(.success((result)))
                    } catch {
                        Log.e("Worker error: \(error.localizedDescription)")
                        single(.failure(error))
                    }
                    return
                }
            }
            
            return disposable
        }
    }
}
