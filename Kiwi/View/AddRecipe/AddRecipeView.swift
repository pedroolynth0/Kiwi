import SwiftUI

struct AddRecipeView: View {
    @StateObject var recipeViewModel = RecipeViewModel()
    
    let categoryOptions = ["Fast-Food", "Pizza", "Massa"]
    
    let recipeData = RecipeData().recipes
    @State var selectedTime = Date()
    
    @State private var dynamicDescriptionHeight: CGFloat = 100
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20){
                    Text("Adicionar Receita")
                        .font(.largeTitle)
                        .bold()
                    
                    VStack(alignment: .leading){
                        Text("Nome:")
                            .padding([.top, .leading, .trailing])
                        TextField("Ex: Carne...", text: $recipeViewModel.recipe.name)
                            .padding(16.0)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                    }
                    VStack(alignment: .leading){
                        Text("Descrição:")
                            .padding([.top, .leading, .trailing])
                        TextEditor(text: $recipeViewModel.recipe.description)
                            .frame(minHeight: dynamicDescriptionHeight, maxHeight: dynamicDescriptionHeight)
                            .padding(16.0)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            .scrollContentBackground(.hidden)
                            .onAppear {
                                // Calcula a altura inicial do campo de texto de descrição
                                dynamicDescriptionHeight = getHeightForText(recipeViewModel.recipe.description)
                            }
                            .onChange(of: recipeViewModel.recipe.description) { newValue in
                                // Atualiza a altura do campo de texto de descrição conforme o usuário digita
                                dynamicDescriptionHeight = getHeightForText(newValue)
                            }
                        DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                            .labelsHidden() // Para ocultar o rótulo do DatePicker
                            .datePickerStyle(.wheel) 
                            .environment(\.locale, Locale(identifier: "en_GB"))


                    }
                    VStack(alignment: .leading){
                        Text("Categoria:")
                            .padding([.top, .leading, .trailing])
                        customPicker(selection: $recipeViewModel.recipe.category, options: categoryOptions)
                            .frame(maxWidth: .infinity)
                            .padding(16.0)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            
                    }
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        NavigationLink(destination: AddRecipeView2()) {
                            
                            HStack {
                                Spacer()
                                Text("Proximo")
                                    .padding()
                                    .background(Color(UIColor.systemGray6))
                                    .cornerRadius(10)
                            }
                        }
                        
                        .padding()
                    }
                }.padding()
        }
           
        }
        .environmentObject(recipeViewModel)
    }
    

}

extension AddRecipeView {
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
        return max(size.height, 80) // Defina um mínimo de altura
    }
    
    private func addStep() {
        recipeViewModel.recipe.steps.append("")
    }

    private func deleteStep(at offsets: IndexSet) {
        recipeViewModel.recipe.steps.remove(atOffsets: offsets)
    }
}

struct AddReceitaView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
