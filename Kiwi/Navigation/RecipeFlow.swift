//
//  RecipeFlow.swift
//  Kiwi
//
//  Created by dti digital on 02/02/24.
//

import Foundation
import SwiftUI

class RecipeFlow: ObservableObject {
    static let shared = RecipeFlow()
    var recipe: Recipe = Recipe(_id: "1", name: "", category: "Fast-Food", description: "", image: "", steps: [""], ingredients: [""], difficulty: "Fácil", time: "00:00", meal: "")
    
    @Published var path = NavigationPath()
    
    func clear() {
        path = .init()
    }
    
    func navigateBackToRoot() {
        path.removeLast(path.count)
    }
    
    func backToPrevious() {
        path.removeLast()
    }
    
    func done() {
        path = .init()
    }
    
    func navigateToAddRecipeView() {
        path.append(RecipeNavigation.addRecipeView)
    }
    
    func navigateToAddRecipeView2() {
        path.append(RecipeNavigation.addRecipeView2)
    }
    
    func navigateToAddRecipeView3() {
        path.append(RecipeNavigation.addRecipeView3)
    }
    
    func navigateToAddRecipeView4() {
        path.append(RecipeNavigation.addRecipeView4)
    }
}
