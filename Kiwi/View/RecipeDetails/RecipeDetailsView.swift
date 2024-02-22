import SwiftUI

struct RecipeDetailsView: View {
    @StateObject var viewModel: RecipeDetailsViewModel
    
    var body: some View {
        
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    GeometryReader {
                        geometry in
                        if let image = viewModel.recipe.image?.imageFromBase64 {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width,height: geometry.size.height)
                                .ignoresSafeArea()
                                .clipped()
                            
                        }
                        else {
                            Image(systemName: "photo.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width,height: geometry.size.height)
                                .ignoresSafeArea()
                                .clipped()
                                .foregroundColor(Color(UIColor.systemGray5))
                        }
                    }
                    .frame(height: 260)
                    
                    details()
                        .padding(.horizontal)
                    
                }
                .ignoresSafeArea()
            }
            .alertQueue(viewModel.alertQueue)
            .edgesIgnoringSafeArea(.top)
        }
}

extension RecipeDetailsView {
    
    func details() -> some View {
        VStack(alignment: .leading,spacing: 10) {
            
            recipeTitle()
            recipeGrid()
                .font(.callout)
                .foregroundColor(Color.gray)
            
            Text("Descrição")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.vertical, 5.0)
            
            Text(viewModel.recipe.description)
                .font(.callout)
                .foregroundColor(Color.gray)
            Text("Ingredientes")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.vertical, 5.0)
            
            ForEach(viewModel.recipe.ingredients, id: \.self){ ingredient in
                Text("- " + ingredient)
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            Text("Instruções")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.vertical, 5.0)
            
            ForEach(0 ..< viewModel.recipe.steps.count, id: \.self){ step in
                
                Text("\(step + 1). \(viewModel.recipe.steps[step])")
                    .font(.callout)
                    .foregroundColor(.gray)
            }
        }
    }
    func recipeTitle() -> some View {
        HStack {
            VStack (alignment: .leading) {
                Text(viewModel.recipe.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.red)
                
                Text("By Pedro Olyntho")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
            }
            Spacer()
            favoriteButton()
        }
    }
    
    func favoriteButton() -> some View {
            return VStack {
                Button(action: viewModel.toggleFavorite) {
                    if  viewModel.favorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    }
                    else {
                        Image(systemName: "star")
                            .foregroundColor(Color.yellow)
                    }
                    
                }
            }
        }

    func recipeGrid() -> some View {
        HStack(spacing: 20) {
            HStack(){
                Image(systemName: "clock")
                Text(viewModel.recipe.time)
            }
            HStack{
                Image(systemName: "chart.bar")
                Text(viewModel.recipe.difficulty)
            }
        }
    }
}
    



struct ReceitaDetalhesView_Previews: PreviewProvider {
    static var previews: some View {
        let recipe: Recipe = Recipe(_id: "1", name: "", category: "Fast-Food", description: "", image: "", steps: [""], ingredients: [""], difficulty: "Fácil", time: "00:00", meal: "")
        RecipeDetailsView(viewModel: RecipeDetailsViewModel(recipe: recipe))
    }
}
