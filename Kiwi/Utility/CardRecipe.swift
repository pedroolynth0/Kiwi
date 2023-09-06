//
//  CardReceita.swift
//  Kiwi
//
//  Created by dti digital on 29/08/23.
//

import SwiftUI

struct CardRecipe: View {
    var recipe : Recipe
    var body: some View {
        ZStack{
            //MARK: -3. Low
            GeometryReader{ geometry in
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(20.0)
                    
                    
                
                VStack {
                    Spacer()
                    Text(recipe.name)
                        .fontWeight(.bold)
                        .font(.system(size:36))
                        .multilineTextAlignment(.center)
                        .padding(30)
                    
                }.foregroundColor(Color.white)
                
            }
            
            
        }
        
    }
}

struct CardReceita_Previews: PreviewProvider {
    static var previews: some View {
        
        CardRecipe(recipe: RecipeData().recipes[0])
    }
}
