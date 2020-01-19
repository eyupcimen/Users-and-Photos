//
//  UL_ChallangeTests.swift
//  UL_ChallangeTests
//
//  Created by eyup cimen on 19.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import XCTest
@testable import UL_Challange

class UL_ChallangeTests: XCTestCase {
    
    private var service : MockNetworkService!
    private var viewModel : UserListViewModel!
    private var view : MockViewModel!

    override func setUp() {
        service = MockNetworkService()
        viewModel = UserListViewModel(service: service)
    }

    override func tearDown() {
        
    }

    func testLoad() {
        
        XCTAssertEqual(viewModel.hudShow, false)
        do {
            let users = try ResourceLoader.loadData(resource: .users)
            XCTAssertEqual(users.id, 1)
        } catch {
            XCTFail()
        }
    }
}

private class MockViewModel : BaseViewModel {
    
    private let service = MockNetworkService()
    var users : [User] = []
}
