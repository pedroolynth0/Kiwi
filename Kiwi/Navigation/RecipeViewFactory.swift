//
//  RecipeViewFactory.swift
//  Kiwi
//
//  Created by dti digital on 02/02/24.
//

import Foundation
import SwiftUI

class RecipeViewFactory {
    
    static func setViewForDestination(_ destination: RecipeNavigation, recipe: Recipe? = nil) -> AnyView {
        
        switch destination {
        case .addRecipeView:
            return AnyView(AddRecipeView())
        case .addRecipeView2:
            return AnyView(AddRecipeView2())
        case .addRecipeView3:
            return AnyView(AddRecipeView3())
        case .addRecipeView4:
            return AnyView(AddRecipeView4())
        case .recipeDetailsView:
            if let recipe = recipe {
                return AnyView(RecipeDetailsView(viewModel: RecipeDetailsViewModel(recipe: recipe)))
            } else {
                return AnyView(EmptyView())
            }
        case .forMeView:
            return AnyView(ForMeView())
        case .categoryView:
            return AnyView(CategoryView(category: ""))
        }
    }
}
