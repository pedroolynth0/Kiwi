import SwiftUI

struct AddRecipeView3: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @EnvironmentObject var recipeFlow: RecipeFlow
    
    var body: some View {
        ZStack {
            VStack {
                Text("Ingredientes")
                    .font(.largeTitle)
                    .bold()
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(Array(recipeViewModel.recipe.ingredients.enumerated()), id: \.offset) { index, _ in
                            HStack {
                                TextField("Ingrediente \(index + 1)", text: $recipeViewModel.recipe.ingredients[index])
                                    .padding()
                                    .frame(minHeight: 44)
                                    .background(Color(UIColor.systemGray6))
                                    .cornerRadius(10)

                                Button(action: {
                                    deleteStep(at: index)
                                }) {
                                    Image(systemName: "minus.circle.fill")
                                        .foregroundColor(.red)
                                }
                                .padding(.leading, 5)
                            }
                            .padding(.horizontal)
                        }

                        Button(action: addStep) {
                            Label("Adicionar Ingrediente", systemImage: "plus.circle")
                        }
                        .padding(.top, 10)
                    }
                }
                .padding(.bottom, 80)
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        recipeFlow.navigateToAddRecipeView4()
                    }) {
                        Text("Próximo")
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                    }
                    .padding(20)
                }
            }
        }
    }
    
    private func addStep() {
        recipeViewModel.recipe.ingredients.append("")
    }
    
    private func deleteStep(at index: Int) {
        recipeViewModel.recipe.ingredients.remove(at: index)
    }
}

struct AddReceitaView3_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView3()
            .environmentObject(RecipeViewModel())
    }
}
