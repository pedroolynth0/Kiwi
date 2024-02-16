//
//  HomeView.swift
//  Kiwi
//
//  Created by dti digital on 29/08/23.
//

import SwiftUI

struct MyRecipesView: View {
    @EnvironmentObject var recipeFlow: RecipeFlow
    @StateObject var viewModel = MyRecipesViewModel()
    
    var body: some View {
        NavigationStack(path: $recipeFlow.path) {
            ScrollView {
                
                VStack(alignment: .leading){
                    Text("Minhas Receitas")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    VStack (alignment: .leading){
                        ForEach(viewModel.recipeData, id: \.uniqueID){ recipe in
                                NavigationLink(destination: RecipeDetailsView(recipe: recipe)) {
                                    HorizontalRecipeView(recipe: recipe)
                                }
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Button(action: {
                        recipeFlow.navigateToAddRecipeView()
                    }) {
                        HStack {
                            Spacer()
                            Text("Adicionar Receita")
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                }
                .navigationDestination(for: RecipeNavigation.self) { destination in
                    RecipeViewFactory.setViewForDestination(destination)
                }
            }
        }
        .onAppear{ viewModel.getData() }
    }
}


struct MyRecipes_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipesView()
    }
}
