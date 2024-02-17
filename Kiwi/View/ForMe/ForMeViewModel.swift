//
//  ForMeViewModel.swift
//  Kiwi
//
//  Created by dti digital on 16/02/24.
//

import SwiftUI


class ForMeViewModel: ObservableObject {
    @Published var recipeData: [Recipe] = []
    
    func getData() {
        do {
            recipeData = try RecipeManager.loadRecipes()
        } catch {
            recipeData = []
        }
    }
}