import SwiftUI

struct AddRecipeView3: View {
    
    let categoryOptions = ["Fast-Food", "Pizza", "Massa"]
    @State var name = ""
    @State var category = ""
    @State var description = ""
    @State var image = ""
    @State var steps = [""]
    @State var ingredients = [""]
    @State var difficulty = ""
    @State var time = ""
    @State var meal = ""
    
    let recipeData = RecipeData().recipes
    
    @State private var dynamicDescriptionHeight: CGFloat = 100
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20){
                    Text("Ingredientes")
                        .font(.largeTitle)
                        .bold()
                    VStack(alignment: .leading) {

                        List {
                            ForEach(0..<ingredients.count, id: \.self) { index in
                                TextField("Ingrediente \(index + 1)", text: $ingredients[index])
                                    .padding(16.0)
                                    .background(Color(UIColor.systemGray6))
                                    .cornerRadius(10)
                                    
                            }
                            .onDelete(perform: deleteStep)
                        }
                        .frame(height: max(CGFloat(80 * ingredients.count), 200))
                    .scrollContentBackground(.hidden)
                    }

                    Button(action: addStep) {
                        Label("Adicionar Ingrediente", systemImage: "plus.circle")
                    }
                    VStack(alignment: .leading) {
                        NavigationLink(destination: AddRecipeView4()) {
                            
                            HStack {
                                Spacer()
                                Text("Proximo")
                                    .padding()
                                    .background(Color(UIColor.systemGray6))
                                    .cornerRadius(10)
                            }
                        }.padding()
                    }

                    Spacer()
                    
                }.padding()
            }
        }
    }
    

}

extension AddRecipeView3 {
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
        ingredients.append("")
    }

    private func deleteStep(at offsets: IndexSet) {
        ingredients.remove(atOffsets: offsets)
    }
}

struct AddReceitaView3_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView3()
    }
}
