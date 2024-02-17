import SwiftUI

struct AddRecipeView2: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @EnvironmentObject var recipeFlow: RecipeFlow
    
    var body: some View {
        
            VStack {
                Text("Etapas")
                    .font(.largeTitle)
                    .bold()
                ScrollView {
                    LazyVStack(spacing: 20){
 
                        VStack(alignment: .leading) {

                            List {
                                ForEach(0..<recipeViewModel.recipe.steps.count, id: \.self) { index in
                                    TextField("Etapa \(index + 1)", text: $recipeViewModel.recipe.steps[index])
                                        .padding(16.0)
                                        .background(Color(UIColor.systemGray6))
                                        .cornerRadius(10)
                                        
                                }
                                .onDelete(perform: deleteStep)
                            }
                            .frame(height: max(CGFloat(80 * recipeViewModel.recipe.steps.count), 200))
                        .scrollContentBackground(.hidden)
                        }

                        Button(action: addStep) {
                            Label("Adicionar Etapa", systemImage: "plus.circle")
                        }
                        VStack(alignment: .leading) {
                            Button(action: {
                                recipeFlow.navigateToAddRecipeView3()
                            }) {
                                HStack {
                                    Spacer()
                                    Text("Proximo")
                                        .padding()
                                        .background(Color(UIColor.systemGray6))
                                        .cornerRadius(10)
                                }
                            }
                        }

                        Spacer()
                        
                    }.padding()
                }
            }
        
    }
    

}

extension AddRecipeView2 {
    private func customPicker(selection: Binding<String>, options: [String]) -> some View {
        return VStack {
            Picker("", selection: selection) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
    }
    
    private func getHeightForText(_ text: String) -> CGFloat {
        let textWidth = UIScreen.main.bounds.size.width - 32
        let boundingRect = CGSize(width: textWidth, height: .infinity)
        let size = text.boundingRect(with: boundingRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [.font: UIFont.systemFont(ofSize: 17)], context: nil)
        return max(size.height, 20) // Defina um mínimo de altura
    }
    
    private func addStep() {
        recipeViewModel.recipe.steps.append("")
    }

    private func deleteStep(at offsets: IndexSet) {
        recipeViewModel.recipe.steps.remove(atOffsets: offsets)
    }
}

struct AddReceitaView2_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView2()
            .environmentObject(RecipeViewModel())
    }
}
