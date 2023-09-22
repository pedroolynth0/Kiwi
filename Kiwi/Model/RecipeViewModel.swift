//
//  RecipeViewModel.swift
//  Kiwi
//
//  Created by dti digital on 13/09/23.
//

import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var recipe: Recipe = Recipe(_id: "1", name: "", category: "Fast-Food", description: "", image: "", steps: [""], ingredients: [""], difficulty: "Fácil", time: "00:00", meal: "")
}
