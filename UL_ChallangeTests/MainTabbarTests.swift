//
//  MainTabbarTests.swift
//  UL_ChallangeTests
//
//  Created by eyup cimen on 13.03.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import XCTest
@testable import UL_Challange

class MainTabbarTests: XCTestCase {

    func test_tabbarItemsCount () {
        let sut = makeSUT()
        XCTAssertEqual(sut.tabbarItems.count, 2)
    }
    
    func test_tabbarViewControllersCount () {
        let sut = makeSUT()
        XCTAssertEqual(sut.viewControllers?.count , 2)
    }
    
    func test_firstTabbarItemTagWithFirstIndex () {
        let sut = makeSUT()
        let firstTabbar = sut.tabbarItems[0]
        XCTAssertEqual(firstTabbar.tag, 0)
    }
    
    func test_firstTabbarItemTagWithSecondIndex () {
        let sut = makeSUT()
        let firstTabbar = sut.tabbarItems[1]
        XCTAssertEqual(firstTabbar.tag, 1)
    }
    
    func test_firstTabbarItemTagWithFirstIndexTitle () {
        let sut = makeSUT()
        let firstTabbar = sut.tabbarItems[0]
        XCTAssertEqual(firstTabbar.title, nil)
    }
    
    func makeSUT() -> MainTabbar {
        let sut = MainTabbar()
        _ = sut.view
        return sut
    }
}
