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
                        .padding(.top)
                        
                        HStack{
                            Text("Ingredient")
                                .fontWeight(.heavy)
                                .bold()
                            Spacer()
                            
                        }.navigationTitle(((detailViewModel.mealRecipie.meals?.first?["strMeal"] ?? "kkkk ") ?? "N/A")).multilineTextAlignment(.leading)
                        IngredientView(meals: detailViewModel.mealRecipie.meals)
                        
                        
                        Spacer()
                        
                    }
                   
                    .onAppear{
                        detailViewModel.fetchData(id: id)
                    }
                    
                    .frame(width: geo.size.width, height: geo.size.height + 800, alignment: .center)
            }
        }
        
       
     
        
        }
        
       
    
    struct DetailView_Previews: PreviewProvider {
        static var previews: some View {
            DetailView().padding()
        }
    }
}

