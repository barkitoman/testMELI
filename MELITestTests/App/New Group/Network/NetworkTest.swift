//
//  Network.swift
//  MELITestTests
//
//  Created by Julian Barco on 21/03/22.
//

import XCTest
@testable import MELITest

class NetworkTests: XCTestCase {
    func test_malformed_url() {
        let sut = NetworkManager(baseUrl: "wrong url!")
        sut.request(method: .get) { _, error in
            if let error = error as? NetworkError {
                XCTAssert(error.localizedDescription == NetworkError.badUrl.localizedDescription)
            } else {
                XCTFail("Wrong error thrown!")
            }
        }
    }
    
    func test_base_url_not_provided() {
        do {
            _ = try NetworkManager.sharedInstance()
        } catch NetworkError.baseUrlNotProvided {
            
        } catch {
            XCTFail("Wrong error thrown!")
        }
    }
    
    func test_base_url_provided() {
        NetworkManager.provideBaseUrl("")
        do {
            _ = try NetworkManager.sharedInstance()
        } catch {
            XCTFail("Should not throw!")
        }
    }
}
