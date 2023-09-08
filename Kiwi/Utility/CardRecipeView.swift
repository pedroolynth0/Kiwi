import SwiftUI

struct CardRecipeView: View {
    var recipe: Recipe

    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { geometry in
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(10.0)
            }
            .frame(maxWidth: 200, maxHeight: 200)
            .clipped()

            VStack(alignment: .leading) {
                Text(recipe.category)
                    .font(.caption)
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                    
                HStack{
                    Text(recipe.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        
                    Spacer()
                }

            }
            .padding(.leading, 10.0)
            .frame(maxWidth: 200, maxHeight: 70)
        }
        .frame(width: 200, height: 275)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
    }
}

struct CardReceitaView_Previews: PreviewProvider {
    static var previews: some View {
        CardRecipeView(recipe: RecipeData().recipes[0])
    }
}
