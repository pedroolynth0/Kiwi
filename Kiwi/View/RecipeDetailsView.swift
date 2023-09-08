import SwiftUI

struct RecipeDetailsView: View {
    var recipe: Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .center, spacing: 20) {
                GeometryReader {
                    geometry in
                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width,height: geometry.size.height)
                        .ignoresSafeArea()
                        .clipped()
                }
                .frame(height: 260)
                
                VStack(alignment: .leading,spacing: 10) {
                    //MARK: Titulo
                    HStack {
                        VStack (alignment: .leading) {
                            Text(recipe.name)
                              .font(.largeTitle)
                              .fontWeight(.heavy)
                              .foregroundColor(.red)
                            
                            Text("By Pedro Olyntho")
                                .font(.footnote)
                                .foregroundColor(Color.gray)
                        }
                        Spacer()
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    }//: Titulo
                    
                    HStack(spacing: 20){
                        HStack(){
                            Image(systemName: "clock")
                            Text(recipe.time)
                        }
                        HStack{
                            Image(systemName: "chart.bar")
                            Text(recipe.difficulty)
                        }
                    }
                    .font(.callout)
                    .foregroundColor(Color.gray)
                    
                    
                    Text("Descrição")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.vertical, 5.0)
                    
                    Text(recipe.description)
                        .font(.callout)
                        .foregroundColor(Color.gray)
                    Text("Ingredientes")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.vertical, 5.0)
                    
                        ForEach(recipe.ingredients, id: \.self){ ingredient in
                            Text("- " + ingredient)
                                .font(.callout)
                                .foregroundColor(.gray)
                        }
                    Text("Instruções")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.vertical, 5.0)
                    
                    ForEach(0 ..< recipe.steps.count, id: \.self){ step in
                        
                        Text("\(step + 1). \(recipe.steps[step])")
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
            
            }
            .ignoresSafeArea()
        }.edgesIgnoringSafeArea(.top)
        
    }
    
    
}

struct ReceitaDetalhesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(recipe: RecipeData().recipes[1])
    }
}
