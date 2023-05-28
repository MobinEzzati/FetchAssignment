//
//  IngredientView.swift
//  SwiftUiTraning
//
//  Created by mobin on 5/25/23.
//

import SwiftUI

struct IngredientView: View {
      var meals: [[String: String?]]?
 
    var body: some View {
        NavigationStack {
            
            ForEach (0..<10){number in
                HStack {
                    Text((meals?.first?["strIngredient\(number)"] ?? "dfd ") ?? "N/A")
                        .fontWeight(.light)
                        .padding(.leading)
                    Spacer()
                    Text((meals?.first?["strMeasure\(number)"] ?? "dfd ") ?? "N/A")
                        .padding(.trailing)
                        .fontWeight(.light)

                }.background()
                    .cornerRadius(8)
            }
            HStack{
                Text("Description")
                    .fontWeight(.heavy)
                    .bold()
                Spacer()
                
            }
            Text( (meals?.first?["strInstructions"] ?? "dfd") ?? "N/A")
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                
        
         
        }
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView().padding()
    }
}
