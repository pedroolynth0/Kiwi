//
//  RecipeDetailsViewModel.swift
//  Kiwi
//
//  Created by dti digital on 18/02/24.
//

import SwiftUI

class RecipeDetailsViewModel: ObservableObject {
    var recipe: Recipe
    @Published var alertQueue = AlertQueue()
    @Published var favorite: Bool
    
    init(recipe: Recipe) {
        self.recipe = recipe
        self.favorite = recipe.favorite
    }
    
    func toggleFavorite() {
        do {
            recipe.favorite = !recipe.favorite
            try RecipeManager.updateRecipe(recipe)
            favorite = recipe.favorite

        }
        catch {
            let alertItem = AlertItem(title: Text("Erro"), message: Text("Não foi possível concluir essa ação!"), dismissButton: .default(Text("OK")))
            alertQueue.add(alertItem)
        }
    }
}
