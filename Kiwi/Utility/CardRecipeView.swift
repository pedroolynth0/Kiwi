import SwiftUI

struct CardRecipeView: View {
    var recipe: Recipe
    @State private var decodedImage: Image =  Image("")

    var body: some View {
        VStack(alignment: .leading) {
            
            if let image = recipe.image?.imageFromBase64 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .cornerRadius(10.0)
                    .clipped()
            } else {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .cornerRadius(10.0)
                    .clipped()
                    .foregroundColor(Color(UIColor.systemGray5))
            }

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
                        .padding(.bottom, 10.0)
                        
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





