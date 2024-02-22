//
//  HorizontalRecipeViewModel.swift
//  Kiwi
//
//  Created by dti digital on 18/02/24.
//

import Foundation
import SwiftUI

class HorizontalRecipeViewModel: ObservableObject {
    var recipe: Recipe
    var disabled: Bool
    @Published var alertQueue = AlertQueue()
    
    init(recipe: Recipe, disabled: Bool) {
        self.recipe = recipe
        self.disabled = disabled
    }
    
    
    
    func removeRecipe() {
        do {
            try RecipeManager.deleteRecipe(recipe._id)
        } catch {
            showWarningAlert()
        }
    }
    
    func showDeleteConfirmationAlert() {
        let alertItem = AlertItem(title: Text("Atenção"), message: Text("Deseja realmente remover a receita \(recipe.name)?"), primaryButton: .default(Text("Remover"), action: {
            self.removeRecipe()
        }), secondaryButton: .cancel(Text("Cancelar")))
        alertQueue.add(alertItem)
    }
    
    func showWarningAlert() {
        let alertItem = AlertItem(title: Text("Erro"), message: Text("Não foi possível remover essa receita"), dismissButton: .default(Text("OK")))
        alertQueue.add(alertItem)
    }
}
