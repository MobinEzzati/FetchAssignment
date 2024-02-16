//
//  DetailView.swift
//  SwiftUiTraning
//
//  Created by mobin on 5/24/23.
//

import SwiftUI

struct DetailView: View {
    var id: String = "53049"
    @StateObject var detailViewModel = DetailViewModel()
    
    var body: some View {
        
        GeometryReader { geo in
            ScrollView {
                    NavigationStack {
                        AsyncImage(url: detailViewModel.createUrl()){ phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(9)
                                    .clipShape(Circle())
                                    .frame(width:geo.size.width , height: geo.size.height / 4)
                                    .padding()
                            case .failure(_):
                                Image(systemName: "exclamationmark.icloud")
                                    .resizable()
                            case .empty:
                                Image(systemName: "exclamationmark.icloud")
                            @unknown default:
                                Image(systemName: "exclamationmark.icloud")
                            }
                        }
                        .navigationTitle((detailViewModel.getFoodTitle()))
                            .multilineTextAlignment(.leading)
                        .padding(.top)
                        
                        IngredientView(meals: detailViewModel.mealRecipie.meals)
                    }
                    .onAppear{
                        detailViewModel.fetchData(id: id)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .fixedSize(horizontal: false, vertical: false)
        }
        
        }
}

#Preview{

    DetailView().padding(.trailing)
}
