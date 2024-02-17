//
//  CategoryViewModel.swift
//  Kiwi
//
//  Created by dti digital on 16/02/24.
//

import SwiftUI
import Combine

class MyRecipesViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()

    @Published var recipeData: [Recipe] = []

    
    init() {
        observeRecipeChanges()
    }
    
    private func observeRecipeChanges() {
        RecipeManager.recipesDidChange
            .sink { [weak self] _ in
                self?.getData()
            }
            .store(in: &cancellables)
    }
    
    func getData() {
        do {
            recipeData = try RecipeManager.loadRecipes()
        } catch {
            recipeData = []
        }
    }
}
