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
        HStack {
            Text("Ingredients")
                .fontWeight(.heavy)
                .bold()
                .padding(.leading)
                .padding(.top)
            Spacer()
        }

        NavigationStack {
            HStack(alignment:.firstTextBaseline){

                
            }
            ForEach(0..<10) { number in
                if let ingredient = meals?.first?["strIngredient\(number)"] as? String,
                   let measure = meals?.first?["strMeasure\(number)"] as? String {
                    HStack {
                        Text(ingredient)
                            .fontWeight(.light)
                            .padding(.leading)
                        Spacer()
                        Text(measure)
                            .padding(.trailing)
                            .fontWeight(.light)
                    }
                    .padding(.trailing)
                    .cornerRadius(8)
                }
            }
 .cornerRadius(8)
        }.padding(.trailing)
        
            
            HStack {
                Text("Description")
                    .fontWeight(.heavy)
                    .bold()
                    .padding(.leading)
                Spacer()
            }
        VStack{
            if let instructions = meals?.first?["strInstructions"] as? String {
                Text(instructions)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.trailing)
                    .padding(.leading)

            } else {
                Text("N/A")
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.trailing)
                    .padding(.leading)
            }
        }.padding(.trailing)

        }
    }


struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {

        IngredientView()

        
    }
}
