//
//  SwiftUiTraningTests.swift
//  SwiftUiTraningTests
//
//  Created by mobin on 5/26/23.
//

import XCTest

final class SwiftUiTraningTests: XCTestCase {
    var vm : ViewModel!
    var detailView: DetailViewModel!
    override func setUpWithError() throws {
        vm = ViewModel()
        detailView = DetailViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_network_connection() {
        vm.fetchData()
        XCTAssertNotNil(vm.meals)
    }
    
    func test_network_connection_detail_view() {
        detailView.fetchData(id:"53049")
        XCTAssertNotNil(detailView.mealRecipie)
    }



    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
