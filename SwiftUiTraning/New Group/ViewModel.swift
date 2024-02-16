//
//  ViewModel.swift
//  SwiftUiTraning
//
//  Created by mobin on 5/19/23.
//

import Foundation
import Combine


class ViewModel: ObservableObject {
    
    @Published var meals = [Meal]()
    private var bag = Set<AnyCancellable>()
    
    func fetchData() {
        NetworkManager.shared.fetchData(url: URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                #if DEBUG
                switch completion {
                case .finished:
                    print("Debug print statement: Request completed successfully")
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
                #endif
            }) { (data: MealsModel) in
                // Handle the decoded data here
                guard let unwrappedMeals = data.meals else {
                          // Handle the case where meals is nil
                          print("Error: Meals is nil")
                          return
                      }
                      self.meals = unwrappedMeals
            }
            .store(in: &bag)

    }
    
    
    func getMeals() -> [Meal]? {
        return meals
    }
}
