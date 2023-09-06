//
//  CardReceita.swift
//  Kiwi
//
//  Created by dti digital on 29/08/23.
//

import SwiftUI

struct CardRecipeView: View {
    var recipe : Recipe
    var body: some View {

        VStack(alignment: .leading){
            GeometryReader{ geometry in
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                .cornerRadius(20.0)
                
            }
            Text(recipe.category)
                .font(.caption)
                .foregroundColor(.blue)
                .fontWeight(.bold)
            Text(recipe.name)
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black
                )
        }
    }
        
}

struct CardReceitaView_Previews: PreviewProvider {
    static var previews: some View {
        
        CardRecipeView(recipe: RecipeData().recipes[0])
    }
}
