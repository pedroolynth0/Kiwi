import SwiftUI

struct ForMeView: View {
    let recipeData = RecipeData().recipes
    var body: some View {
        
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 20){
                    Text("For Me")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    HStack(){
                        categoryButton(label: "Café da manhã", systemImage: "mug.fill")
                        
                        categoryButton(label: "Almoço", systemImage: "fork.knife")
                    }
                    HStack(){
                        categoryButton(label: "Jantar", systemImage: "carrot.fill")
                        
                        categoryButton(label: "Lanche", systemImage: "takeoutbag.and.cup.and.straw.fill")
                    }
                    
                    Divider()
                    
                    // Chamando a função foodGrid com a categoria desejada
                    foodGrid(label: "Comidas Saudáveis")
                    Divider()
                    foodGrid(label: "Fast-Food")
                    
                }
                .padding()
                Spacer()
            }
        }
    }
}
extension ForMeView{
    private func categoryButton(label: String, systemImage: String) -> some View {
        Button(action: {
            // Ação a ser executada quando o botão for pressionado
            print("Botão pressionado!")
        }) {
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
                Button(action: {
                    // Ação a ser executada quando o botão for pressionado
                    print("Botão pressionado!")
                }) {
                    Text("Ver mais")
                        .font(.caption)
                        .padding(5)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(15)
                }
            }
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(recipeData, id: \.uniqueID){ recipe in
                        NavigationLink(destination: RecipeDetailsView(recipe: recipe)) {
                            CardRecipeView(recipe: recipe)
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
