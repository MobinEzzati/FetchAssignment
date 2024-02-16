//
//  ContentView.swift
//  SwiftUiTraning
//
//  Created by mobin on 4/6/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack {
            
            
            List(viewModel.getMeals() ?? [], id: \.self) { item in
                NavigationLink(destination: DetailView(id: item.idMeal ?? "")) {
                    DessertCellView(meal: item)
                }
            }
            .onAppear {
                viewModel.fetchData()
            }
            .navigationTitle("FoodList")
            
            .frame(width: UIScreen.main.bounds.width)
        }
    }
}

#Preview {
    ContentView()
}
