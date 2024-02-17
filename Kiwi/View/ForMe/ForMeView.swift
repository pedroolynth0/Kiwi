import SwiftUI

struct ForMeView: View {
    @StateObject var viewModel = ForMeViewModel()

    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 20){
                    Text("For Me")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    VStack(alignment: .center){
                        
                        HStack(){
                            categoryButton(label: "Café da manhã", systemImage: "mug.fill")
                            
                            categoryButton(label: "Almoço", systemImage: "fork.knife")
                        }
                        HStack(){
                            categoryButton(label: "Jantar", systemImage: "carrot.fill")
                            
                            categoryButton(label: "Lanche", systemImage: "takeoutbag.and.cup.and.straw.fill")
                        }
                    }.padding()
                    Divider()
                    
                    // Chamando a função foodGrid com a categoria desejada
                    foodGrid(label: "Fast-Food")
                    Divider()
                    foodGrid(label: "Massa")
                    Divider()
                    foodGrid(label: "Pizza")
                }
                .padding()
                Spacer()
            }
        }.onAppear{
            viewModel.getData()
        }
    }
}


extension ForMeView {
    private func categoryButton(label: String, systemImage: String) -> some View {
        NavigationLink(destination: CategoryView(category: label)) {
            HStack {
                Image(systemName: systemImage)
                    .foregroundColor(.blue)
                    .font(.callout)
                    .padding(.leading)

                Text(label)
                    .font(.caption)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.all, 5.0)
            .foregroundColor(.black)
            .frame(width: 170, height: 40)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
        }
    }

    private func foodGrid(label: String) -> some View {
        return VStack{
            HStack {
                Text(label)
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                NavigationLink(destination: CategoryView(category: label)){
                    Text("Ver mais")
                        .font(.caption)
                        .padding(5)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(15)
                }
            }
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(viewModel.recipeData, id: \.uniqueID){ recipe in
                        if (recipe.category == label){
                            NavigationLink(destination: RecipeDetailsView(recipe: recipe)) {
                                CardRecipeView(recipe: recipe)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ForMeView_Previews: PreviewProvider {
    static var previews: some View {
        ForMeView()
    }
}
