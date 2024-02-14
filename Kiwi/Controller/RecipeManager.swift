//
//  RecipeManager.swift
//  Kiwi
//
//  Created by dti digital on 14/02/24.
//

import Foundation


struct RecipeManager {
    private static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    private static let archiveURL = documentsDirectory.appendingPathComponent("recipes").appendingPathExtension("plist")

    static func saveRecipe(_ recipe: Recipe) {
        var existingRecipes = loadRecipes()
        var tmp = recipe
        tmp._id = String(existingRecipes.count)
        existingRecipes.append(tmp)
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(existingRecipes)
            try data.write(to: archiveURL, options: .noFileProtection)
        } catch {
            print("Error saving recipe: \(error)")
        }
    }

    static func deleteRecipe(_ recipeID: String) {
        var existingRecipes = loadRecipes()
        existingRecipes.removeAll { $0._id == recipeID }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(existingRecipes)
            try data.write(to: archiveURL, options: .noFileProtection)
        } catch {
            print("Error deleting recipe: \(error)")
        }
    }

    static func loadRecipes() -> [Recipe] {
        do {
            let data = try Data(contentsOf: archiveURL)
            let decoder = PropertyListDecoder()
            return try decoder.decode([Recipe].self, from: data)
        } catch {
            print("Error loading recipes: \(error)")
            return []
        }
    }
}

