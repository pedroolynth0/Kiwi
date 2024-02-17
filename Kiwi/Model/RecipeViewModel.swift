//
//  RecipeViewModel.swift
//  Kiwi
//
//  Created by dti digital on 13/09/23.
//

import SwiftUI

class RecipeViewModel: ObservableObject {
    var option: Strings = .addRecipe
    let difficultyOptions = ["Fácil","Médio","Difícil"]
    let categoryOptions = ["Fast-Food", "Pizza", "Massa"]


    
    @Published var recipe: Recipe = Recipe(_id: "1", name: "", category: "Fast-Food", description: "", image: "", steps: [""], ingredients: [""], difficulty: "Fácil", time: "00:00", meal: "")

    
    public func customPicker(selection: Binding<String>, options: [String]) -> some View {
        return VStack {
            Picker("", selection: selection) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
    }
    
    public func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    public func convertStringToDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.date(from: recipe.time)
    }
    
    public func getHeightForText(_ text: String) -> CGFloat {
        let textWidth = UIScreen.main.bounds.size.width - 32
        let boundingRect = CGSize(width: textWidth, height: .infinity)
        let size = text.boundingRect(with: boundingRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [.font: UIFont.systemFont(ofSize: 17)], context: nil)
        return max(size.height, 60)
    }
    
    public func addStep() {
        recipe.steps.append("")
    }
    
    public func deleteStep(at offsets: IndexSet) {
        recipe.steps.remove(atOffsets: offsets)
    }
    
    public func cleanCache() {
        let recipe: Recipe = Recipe(_id: "1", name: "", category: "Fast-Food", description: "", image: "", steps: [""], ingredients: [""], difficulty: "Fácil", time: "00:00", meal: "")
        
        self.recipe = recipe
    }
    
    func finalStep() {
        switch option {
        case .addRecipe:
            addRecipe()
        case.editRecipe:
            editRecipe()
        }

    }
    
    func addRecipe() {
        do {
            try RecipeManager.saveRecipe(recipe)
        } catch RecipeError.saveFailure(_ ) {
            print("Erro ao salvar a receita")
        } catch {
            print("Ocorreu um erro ao criar a receita")
        }
    }
    
    func editRecipe() {
        do {
            try RecipeManager.updateRecipe(recipe)
        } catch RecipeError.saveFailure(_ ) {
            print("Erro ao salvar a receita")
        } catch {
            print("Ocorreu um erro ao editar a receita")
        }
    }
}
