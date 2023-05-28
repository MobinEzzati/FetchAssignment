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
            
            List(viewModel.meals, id:\.self){ item in
                NavigationLink(destination: DetailView(id: item.idMeal!)) {
                    
                    DessertCellView(meal: item)
                }
                
            }.onAppear{
                viewModel.fetchData()
            }.navigationTitle("FoodList")
                .padding(.top)
                .frame(width: UIScreen.main.bounds.width)
        }
        
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
