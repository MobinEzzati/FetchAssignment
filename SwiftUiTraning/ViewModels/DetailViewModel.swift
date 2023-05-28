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
        guard let url = URL(string: UrlBuilder.shared.buildURl(id: id)) else {
            return
        }
        print(url)
        
        URLSession.shared
             .dataTaskPublisher(for: url)
             .map{$0.data}
             .decode(type: Welcome.self, decoder: JSONDecoder())
             .receive(on: DispatchQueue.main)
             .sink(receiveCompletion: { completion in
                 
                 switch completion {
                           case .finished:
                               print("Request completed successfully")
                           case .failure(let error):
                               print("Request failed with error: \(error)")
                           }
             }) { data in
             
                 self.mealRecipie = data
                
             }
             .store(in: &bag)
        
    }
    
    
    func createUrl() -> URL? {
        guard  let url =  mealRecipie.meals?.first!["strMealThumb"] else {
            return nil
        }
                
        return URL(string: url ?? "ddfd")
    }
}
