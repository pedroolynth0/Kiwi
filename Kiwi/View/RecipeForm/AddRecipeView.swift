import SwiftUI

struct AddRecipeView: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @EnvironmentObject var recipeFlow: RecipeFlow
    @State var selectedTime = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) ?? Date()
    @State var dynamicDescriptionHeight: CGFloat = 50
    @StateObject private var alertQueue = AlertQueue()
    var body: some View {
        
        ZStack{
            VStack {
                Text(recipeViewModel.option.title)
                    .font(.largeTitle)
                    .bold()
                ScrollView {
                    LazyVStack(spacing: 10){
                        recipeName()
                        recipeDescription()
                        difficultyLevel()
                        recipeCategory()
                        preparationTime()
                            .padding()
                        Spacer()
                    }.padding()
                }
            }
            nextButton()
        }
        .alertQueue(alertQueue)
        .onAppear {
            selectedTime = recipeViewModel.convertStringToDate() ??
            Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) ??
            Date()
        }
    }
}

extension AddRecipeView {
    
    private func recipeName() -> some View {
        VStack(alignment: .leading) {
            Text("Nome:")
                .padding([.top, .leading, .trailing])
            TextField("Ex: Carne...", text: $recipeViewModel.recipe.name)
                .padding(16.0)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
        }
    }
    
    private func recipeDescription() -> some View {
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
                    dynamicDescriptionHeight = recipeViewModel.getHeightForText(recipeViewModel.recipe.description)
                }
                .onChange(of: recipeViewModel.recipe.description) { newValue in
                    dynamicDescriptionHeight = recipeViewModel.getHeightForText(newValue)
                }
        }
    }
    
    private func difficultyLevel() -> some View {
        VStack(alignment: .leading) {
            Text("Dificuldade:")
                .padding([.top, .leading, .trailing])
            recipeViewModel.customPicker(selection: $recipeViewModel.recipe.difficulty, options: recipeViewModel.difficultyOptions)
                .frame(maxWidth: .infinity)
                .padding(10.0)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
            
        }
    }
    
    private func recipeCategory() -> some View {
        VStack(alignment: .leading){
            Text("Categoria:")
                .padding([.top, .leading, .trailing])
            recipeViewModel.customPicker(selection: $recipeViewModel.recipe.category, options: recipeViewModel.categoryOptions)
                .frame(maxWidth: .infinity)
                .padding(10.0)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
        }
    }
    
    private func preparationTime() -> some View {
        HStack {
            Text("Tempo de preparo: ")
            DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .environment(\.locale, Locale(identifier: "en_GB"))
                .onChange(of: selectedTime) { newValue in
                    recipeViewModel.recipe.time = recipeViewModel.formatTime(newValue)
                }
            Spacer()
        }
    }
    
    private func nextButton() -> some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    if recipeViewModel.recipe.name.isEmpty {
                        let alertItem = AlertItem(title: Text("Informação Faltante"), message: Text("O campo nome está vazio."), dismissButton: .default(Text("OK")))
                        alertQueue.add(alertItem)
                    } else {
                        recipeFlow.navigateToAddRecipeView2()
                    }
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

struct AddReceitaView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
            .environmentObject(RecipeViewModel())
    }
}
