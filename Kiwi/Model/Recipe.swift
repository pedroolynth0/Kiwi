import Foundation

struct Recipe: Codable {
    var _id: String
    var name: String
    var category: String
    var description: String
    var image: String?
    var steps: [String]
    var ingredients: [String]
    var difficulty: String
    var time: String
    var meal: String
    
    init(_id: String, name: String, category: String, description: String, image: String, steps: [String], ingredients: [String], difficulty: String, time: String, meal: String) {
        self._id = _id
        self.name = name
        self.category = category
        self.description = description
        self.image = image
        self.steps = steps
        self.ingredients = ingredients
        self.difficulty = difficulty
        self.time = time
        self.meal = meal
    }
    
    var uniqueID: String {
        return UUID().uuidString
    }
}

struct RecipeManager {
    private static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    private static let archiveURL = documentsDirectory.appendingPathComponent("recipes").appendingPathExtension("plist")

    static func saveRecipe(_ recipe: Recipe) {
        var existingRecipes = loadRecipes() 
        existingRecipes.append(recipe)
        
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

