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
        
        let users = try ResourceLoader.loadData(resource: .users)
        let posts = try ResourceLoader.loadData(resource: .posts)
        viewModel.users = [users]
        
        
        XCTAssertEqual(try viewModel.hudShow, true)
        XCTAssertEqual(try viewModel.users.count, 1)
    }
}

private class MockViewModel : BaseViewModel {
    
    private let service : MockNetworkService!
    var viewModel : UserListViewModel!
    var users : [UserObject] = []
    
}
