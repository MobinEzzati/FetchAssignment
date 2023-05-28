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
        
       URLSession.shared
            .dataTaskPublisher(for: URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!)
            .map{$0.data}
            .decode(type: MealsModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                          case .finished:
                              print("Request completed successfully")
                          case .failure(let error):
                              print("Request failed with error: \(error)")
                          }
            }) { data in
                self.meals = data.meals!
            }
            .store(in: &bag)
 
            
            

    }
}
