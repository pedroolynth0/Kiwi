//
//  RecipeViewModel.swift
//  Kiwi
//
//  Created by dti digital on 13/09/23.
//

import SwiftUI

class RecipeViewModel: ObservableObject {
   @Published var recipe: Recipe = Recipe(name: "", category: "", description: "", image: Image(""), steps: [""], ingredients: [""], difficulty: "", time: "", meal: "")
}
