//
//  CategoryView.swift
//  Kiwi
//
//  Created by dti digital on 11/09/23.
//

import SwiftUI

struct CategoryView: View {
    let category: String
    @StateObject var viewModel = CategoryViewModel()
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading){
                    Text(category)
                        .font(.largeTitle)
                        .bold()
                    VStack (alignment: .leading){
                        ForEach(viewModel.recipeData, id: \.uniqueID){ recipe in
                            if (recipe.category == category || recipe.meal == category){
                                NavigationLink(destination: RecipeDetailsView(recipe: recipe)) {
                                    HorizontalRecipeView(recipe: recipe)
                                        .padding()
                                }
                            }
                        }
                    }

                }.padding()
            }
        }
        .onAppear{ viewModel.getData() }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: "Fast-Food")
    }
}
