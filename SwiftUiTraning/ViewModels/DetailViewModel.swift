//
//  DetailViewController.swift
//  SwiftUiTraning
//
//  Created by mobin on 5/24/23.
//

import Foundation
import Combine



class DetailViewModel: ObservableObject {
    
    private var bag = Set<AnyCancellable>()
    @Published var mealRecipie = Welcome()
        
    func fetchData(id: String) {
            guard let url = URL(string: UrlBuilder().buildURl(id: id)) else {
                return
            }

        NetworkManager.shared.fetchData(url: url)
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
            }) { (data: Welcome) in
                // No need for guard statement since data is not optional
                self.mealRecipie = data
            }
            .store(in: &bag)

        }
    
    
    
    func createUrl() -> URL? {
        guard let meals = mealRecipie.meals,
              let firstMeal = meals.first,
              let imageUrlString = firstMeal["strMealThumb"] as? String,
              let url = URL(string: imageUrlString) else {
            // Handle the case where any of the optional values is nil
            return nil
        }
        
        return url
    }
    
    
    func getFoodTitle() -> String {
        guard let foodTitle = mealRecipie.meals?.first?["strMeal"] as? String else {
            return "N/A"
        }
        return foodTitle
    }
}
