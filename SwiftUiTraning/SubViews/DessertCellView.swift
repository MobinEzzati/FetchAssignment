//
//  DessertCellView.swift
//  SwiftUiTraning
//
//  Created by mobin on 5/23/23.
//

import SwiftUI

struct DessertCellView: View {
     var meal:Meal!

    var body: some View {
        GeometryReader { size in
            HStack(){
                CacheAsyncImage(url: URL(string: meal.strMealThumb ?? "")!) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure(_):
                        // Handle failure case differently, if needed
                        Text("Image Loading Failed")
                            .foregroundColor(.red)
                            .font(.headline)
                    default:
                        Image(systemName: "exclamationmark.icloud")
                            .resizable()
                            .scaledToFit()
                    }
                }
                .frame(width: size.size.width / 4)

                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Food Name: \(meal.strMeal ?? "N/A")")
                        .bold()
                        .font(.headline)
                    
                    Text("Food ID: \(meal.idMeal ?? "N/A")")
                        .bold()
                        .font(.headline)
                }
                .padding(.leading)
                Spacer()

                
            }
            .frame(width: size.size.width ,
                    height: (size.size.height))
            .background(.orange)
            .cornerRadius(10)
            
        }.frame(height: 100)
    }
}

struct DessertCellView_Previews: PreviewProvider {
    static var previews: some View {
        DessertCellView()
    }
}
