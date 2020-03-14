//
//  UserListViewControllerTest.swift
//  UL_ChallangeTests
//
//  Created by eyup cimen on 13.03.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import XCTest
@testable import UL_Challange

class UserListViewControllerTest: XCTestCase {

    func test_userListZeroItem () {
        let sut = makeSUT()
        XCTAssertEqual(sut.viewModel.users.count , 0)
    }
    
    func makeSUT() -> UserListViewController {
        let sut = UserListViewController()
        sut.viewModel = UserListViewModel(service: app.service)
        _ = sut.view
        return sut
    }

}
