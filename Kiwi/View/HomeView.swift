//
//  HomeView.swift
//  Kiwi
//
//  Created by dti digital on 29/08/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var Teste = ""
    let recipeData = RecipeData().recipes
    var body: some View {
        NavigationStack{
            VStack{
                TextField("Pesquisar", text: $Teste)
                    .padding(16.0)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(20)
                
                ScrollView(.horizontal,showsIndicators: false){
                    
                    HStack {
                        ForEach(recipeData , id: \.uniqueID){ receita in
                            NavigationLink(destination: RecipeDetailsView(recipe: receita)) {
                                CardRecipe(recipe: receita)
                                    .padding(EdgeInsets(top: 40, leading: 10, bottom: 40, trailing: 10))
                                    .frame(width: 300)
                            }

                        }
                    }
                }
            }
            .padding(20.0)
            .background(Color.white)
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
