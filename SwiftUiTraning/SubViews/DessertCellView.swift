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
                CacheAsyncImage(url: URL(string: meal.strMealThumb!)!){ phase in
                   switch phase {
              
                
                   case .success(let image):
                       image
                           .resizable()
                           .scaledToFill()
                
                   case .failure(_):
                       Image(systemName: "exclamationmark.icloud")
                           .resizable()
                           .scaledToFit()
                
                   case .empty:
                       Image(systemName: "exclamationmark.icloud")
                   @unknown default:
                       Image(systemName: "exclamationmark.icloud")
                   }
               }.frame(width: size.size.width/4)
               
                
                
                VStack(alignment: .leading) {
                    Text("food Name is \(meal.strMeal ?? "N/A") ")
                        .bold()
                        .font(.system(.headline))
                        
                
                    Text("food Id is \(meal.idMeal ?? " ")")
                        .bold()
                        .font(.system(.headline))
                       
                       
                }.padding(.leading)
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
