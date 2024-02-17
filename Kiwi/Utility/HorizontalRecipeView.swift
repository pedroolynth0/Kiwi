//
//  HorizontalRecipeView.swift
//  Kiwi
//
//  Created by dti digital on 11/09/23.
//

import SwiftUI

struct HorizontalRecipeView: View {
    var recipe: Recipe
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @EnvironmentObject var recipeFlow: RecipeFlow
    var body: some View {
        HStack{
            if let image = recipe.image?.imageFromBase64 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(10.0)
                    .clipped()
                    .padding(8.0)
                
            }
            else {
               Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(10.0)
                    .clipped()
                    .padding(8.0)
                    .foregroundColor(Color(UIColor.systemGray5))
           }
            VStack(alignment: .leading,spacing: 5) {
                Text(recipe.name)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .foregroundColor(.black)
                iconGrid()
                
                Text(recipe.description)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            .padding(.trailing, 4.0)
            
            Spacer()
            VStack {
                Button(action: {
                    recipeViewModel.option = .editRecipe
                    recipeViewModel.recipe = self.recipe
                    recipeFlow.navigateToAddRecipeView()
                }) {
                    Image(systemName: "pencil")
                }
            }
            .navigationDestination(for: RecipeNavigation.self) { destination in
                RecipeViewFactory.setViewForDestination(destination)
            }
            VStack {
                Button(action: {
                    do {
                        try RecipeManager.deleteRecipe(recipe._id)
                    } catch {
                        print("Erro ao tentar excluir uma receita")
                    }
                    
                }) {
                    Image(systemName: "minus.circle")
                }
            }
            .padding(.trailing, 8)
            .navigationDestination(for: RecipeNavigation.self) { destination in
                RecipeViewFactory.setViewForDestination(destination)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10.0)
        .padding([.top, .leading, .trailing])
        
    }
}


extension HorizontalRecipeView{
    private func iconGrid() -> some View{
        return HStack(spacing: 10){
            HStack{
                Image(systemName: "clock")
                Text(recipe.time)
            }
            
            HStack{
                Image(systemName: "chart.bar")
                Text(recipe.difficulty)
            }
        }
        .font(.system(size:12))
        .foregroundColor(Color(UIColor.systemGray))
    }
    
    private func imageSettings(imageName: String) -> some View{
            Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: 100, maxHeight: 100)
            .cornerRadius(10.0)
            .clipped()
            .padding(8.0)
    }
}

struct HorizontalRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalRecipeView(recipe: RecipeData().recipes[0])

    }
}
