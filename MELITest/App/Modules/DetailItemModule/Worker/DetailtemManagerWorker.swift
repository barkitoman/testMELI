//
//  DetailtemsManagerWorker.swift
//  MELITest
//
//  Created by Julian Barco on 17/03/22.
//

import Foundation
import RxSwift

protocol DetailItemWorker {
    func getDetailtItem(itemId: String) -> Single<DetailItem>
}

struct DetailtemManagerWorker: DetailItemWorker {
    
    func getDetailtItem(itemId: String) -> Single<DetailItem> {
        return Single.create { single in
            let disposable = Disposables.create()
            
            let manager: NetworkManager
            do {
                manager = try NetworkManager.sharedInstance()
            } catch {
                single(.failure(error))
                return disposable
            }
            manager.request(method: NetworkMethod.get, path: ApiService.items, params: ["ids": itemId]) { data, error in
                if let error = error {
                    single(.failure(error))
                    return
                }
                
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode([DetailItem].self, from: data)
                        single(.success((result[0])))
                    } catch {
                        //                        MLLogger.instance.log("worker error: \(error.localizedDescription)", level: .debug)
                        print(error.localizedDescription)
                        single(.failure(error))
                    }
                    return
                }
            }
            
            return disposable
        }
    }
}
