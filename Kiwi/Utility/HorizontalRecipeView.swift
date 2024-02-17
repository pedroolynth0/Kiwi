//
//  HorizontalRecipeView.swift
//  Kiwi
//
//  Created by dti digital on 11/09/23.
//

import SwiftUI

struct HorizontalRecipeView: View {
    var recipe: Recipe
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @EnvironmentObject var recipeFlow: RecipeFlow
    @State var showAlert = false
    var disabled: Bool = false
    var body: some View {
        HStack{
            recipeImage(recipe.image)
            
            VStack(alignment: .leading,spacing: 5) {
                Text(recipe.name)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .foregroundColor(.black)
                iconGrid()
                
                Text(recipe.description)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            .padding(.trailing, 4.0)
            
            Spacer()
            if !disabled {
                editButton()
                    .navigationDestination(for: RecipeNavigation.self) { destination in
                        RecipeViewFactory.setViewForDestination(destination)
                    }
                deleteButton()
                    .padding(.trailing, 8)
            }

        }
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10.0)
        .padding([.top, .leading, .trailing])
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Atenção"),
                message: Text("Deseja realmente remover uma receita?"),
                primaryButton: .default(Text("Remover"), action: {
                    do {
                        try RecipeManager.deleteRecipe(recipe._id)
                    } catch {
                        print("Não foi possivel remover essa receita")
                    }
                }),
                secondaryButton: .cancel(Text("Cancelar"), action: {})
            )
        }
    }
}


extension HorizontalRecipeView {
    private func iconGrid() -> some View{
        return HStack(spacing: 10){
            HStack{
                Image(systemName: "clock")
                Text(recipe.time)
            }
            
            HStack{
                Image(systemName: "chart.bar")
                Text(recipe.difficulty)
            }
        }
        .font(.system(size:12))
        .foregroundColor(Color(UIColor.systemGray))
    }
    
    private func imageSettings(imageName: String) -> some View{
            Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: 100, maxHeight: 100)
            .cornerRadius(10.0)
            .clipped()
            .padding(8.0)
    }
    
    func recipeImage(_ base64Image: String?) -> some View {
        Group {
            if let image = recipe.image?.imageFromBase64 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(10.0)
                    .clipped()
            } else {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(10.0)
                    .clipped()
                    .foregroundColor(Color(UIColor.systemGray5))
            }
        }
        .padding(8.0)
    }
    
    func editButton() -> some View {
        VStack {
            Button(action: {
                recipeViewModel.option = .editRecipe
                recipeViewModel.recipe = self.recipe
                recipeFlow.navigateToAddRecipeView()
            }) {
                Image(systemName: "pencil")
            }
        }
    }
    func deleteButton() -> some View {
        return VStack {
            Button(action: {
                showAlert = true
            }) {
                Image(systemName: "minus.circle")
            }
        }
    }
    
    func cardAlert(isPresented: Binding<Bool>, title: String, message: String, actionTitle: String = "OK", onDismiss: (() -> Void)? = nil, onAction: (() -> Void)? = nil) -> some View {
        self.alert(isPresented: isPresented) {
            Alert(
                title: Text(title),
                message: Text(message),
                primaryButton: .default(Text(actionTitle), action: onAction ?? {}),
                secondaryButton: .cancel(Text("Cancelar"), action: onDismiss)
            )
        }
    }
}


struct HorizontalRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalRecipeView(recipe: RecipeData().recipes[0])

    }
}
