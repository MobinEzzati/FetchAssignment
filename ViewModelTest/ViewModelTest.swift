//
//  ViewModelTest.swift
//  ViewModelTest
//
//  Created by mobin on 2/15/24.
//

import XCTest
import Combine

@testable import SwiftUiTraning

final class ViewModelTest: XCTestCase {
    
    
    func testFetchData() {
        let viewModel = ViewModel()
        // Use XCTestExpectation to wait for the asynchronous operation
        let expectation = XCTestExpectation(description: "Data fetched successfully")
        
        viewModel.fetchData()
        
        // Add a delay to allow the asynchronous operation to complete
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertFalse(viewModel.meals.isEmpty, "Meals should not be empty after fetching data")
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled
        
        
        
    }
    
    func testGetFoodList() {
        
        let viewModel = ViewModel()
        
        XCTAssertTrue(viewModel.getMeals()?.isEmpty ?? false, "Meals should be empty initially")
        
    }
    
    

    
    func testFetcDetailViewModel() {
         var viewModel = DetailViewModel()
         // Use XCTestExpectation to wait for the asynchronous operation
         let expectation = XCTestExpectation(description: "Data fetched successfully")

         viewModel.fetchData(id: "someId")

         // Add a delay to allow the asynchronous operation to complete
         DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
             XCTAssertFalse(viewModel.mealRecipie.meals?.isEmpty ?? true, "Meals should not be empty after fetching data")
             expectation.fulfill()
         }

         // Wait for the expectation to be fulfilled
         wait(for: [expectation], timeout: 5.0)
     }
    
}
