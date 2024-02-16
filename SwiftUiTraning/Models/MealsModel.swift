//
//  UserModel.swift
//  SwiftUiTraning
//
//  Created by mobin on 5/18/23.
//

import Foundation


// MARK: - Welcome
struct MealsModel: Codable {
    let meals: [Meal]?
}


// MARK: - Meal
struct Meal: Codable , Hashable {
    
    let strMeal: String?
    let strMealThumb: String?
    let idMeal: String?
}



