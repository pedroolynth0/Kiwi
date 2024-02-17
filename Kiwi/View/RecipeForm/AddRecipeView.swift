import SwiftUI

struct AddRecipeView: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @EnvironmentObject var recipeFlow: RecipeFlow
    @State var selectedTime = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) ?? Date()
    @State var dynamicDescriptionHeight: CGFloat = 50
    var body: some View {
        
            VStack {
                Text(recipeViewModel.option.title)
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
                                    dynamicDescriptionHeight = recipeViewModel.getHeightForText(recipeViewModel.recipe.description)
                                }
                                .onChange(of: recipeViewModel.recipe.description) { newValue in
                                    // Atualiza a altura do campo de texto de descrição conforme o usuário digita
                                    dynamicDescriptionHeight = recipeViewModel.getHeightForText(newValue)
                                }
                        }
                        VStack(alignment: .leading){
                            Text("Dificuldade:")
                                .padding([.top, .leading, .trailing])
                            recipeViewModel.customPicker(selection: $recipeViewModel.recipe.difficulty, options: recipeViewModel.difficultyOptions)
                                .frame(maxWidth: .infinity)
                                .padding(10.0)
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(10)
                            
                        }
                        VStack(alignment: .leading){
                            Text("Categoria:")
                                .padding([.top, .leading, .trailing])
                            recipeViewModel.customPicker(selection: $recipeViewModel.recipe.category, options: recipeViewModel.categoryOptions)
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
                                    recipeViewModel.recipe.time = recipeViewModel.formatTime(newValue)
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
            .onAppear {
                selectedTime = recipeViewModel.convertStringToDate() ??
                Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) ??
                Date()
            }
    }
}

struct AddReceitaView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
            .environmentObject(RecipeViewModel())
    }
}
