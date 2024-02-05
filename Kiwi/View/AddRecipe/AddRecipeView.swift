import SwiftUI

struct AddRecipeView: View {
    @StateObject var recipeViewModel = RecipeViewModel()
    @EnvironmentObject var recipeFlow: RecipeFlow
    
    let difficultyOptions = ["Fácil","Médio","Difícil"]
    let categoryOptions = ["Fast-Food", "Pizza", "Massa"]
    @State var selectedTime = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) ?? Date()
    
    @State private var dynamicDescriptionHeight: CGFloat = 50
    
    var body: some View {
        
            VStack {
                Text("Adicionar Receita")
                    .font(.largeTitle)
                    .bold()
                ScrollView {
                    LazyVStack(spacing: 10){
                        
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
                            
                            
                        }
                        VStack(alignment: .leading){
                            Text("Dificuldade:")
                                .padding([.top, .leading, .trailing])
                            customPicker(selection: $recipeViewModel.recipe.difficulty, options: difficultyOptions)
                                .frame(maxWidth: .infinity)
                                .padding(10.0)
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(10)
                            
                        }
                        VStack(alignment: .leading){
                            Text("Categoria:")
                                .padding([.top, .leading, .trailing])
                            customPicker(selection: $recipeViewModel.recipe.category, options: categoryOptions)
                                .frame(maxWidth: .infinity)
                                .padding(10.0)
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(10)
                            
                        }
                        
                        HStack {
                            Text("Tempo de preparo: ")
                            DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                                .labelsHidden() // Para ocultar o rótulo do DatePicker
                                .environment(\.locale, Locale(identifier: "en_GB"))
                                .onChange(of: selectedTime) { newValue in
                                    recipeViewModel.recipe.time = formatTime(newValue)
                                }
                            Spacer()
                        }.padding()
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Button(action: {
                                recipeFlow.navigateToAddRecipeView2()
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
    
    private func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm" // Formato de 24 horas
        return formatter.string(from: date)
    }
    
    private func getHeightForText(_ text: String) -> CGFloat {
        let textWidth = UIScreen.main.bounds.size.width - 32
        let boundingRect = CGSize(width: textWidth, height: .infinity)
        let size = text.boundingRect(with: boundingRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [.font: UIFont.systemFont(ofSize: 17)], context: nil)
        return max(size.height, 60) // Defina um mínimo de altura
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
