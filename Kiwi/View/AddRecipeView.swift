//
//  AddReceitaView.swift
//  Kiwi
//
//  Created by dti digital on 29/08/23.
//

import SwiftUI

struct AddRecipeView: View {
    
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
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20){
                Text("Adicionar Receita")
                    .font(.largeTitle)
                    .bold()
                
                VStack(alignment: .leading){
                    Text("Nome:")
                        .padding([.top, .leading, .trailing])
                    TextField("Ex: Pedro", text: $name)
                        .padding(16.0)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(20)
                }
                VStack(alignment: .leading){
                                Text("Categoria:")
                                    .padding([.top, .leading, .trailing])
                                
                    customPicker(selection: $category, options: categoryOptions)
                                        .frame(maxWidth: .infinity)
                                       .padding(16.0)
                                       .background(Color(UIColor.systemGray6))
                                       .cornerRadius(20)
                            }
                VStack(alignment: .leading){
                    Text("Descrição:")
                        .padding([.top, .leading, .trailing])
                    TextField("Ex: Este sanduíche é uma explosão de sabores frescos e texturas crocantes...", text: $description)
                        .padding(16.0)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(20)
                }
                VStack(alignment: .leading){
                    Text("Imagem:")
                        .padding([.top, .leading, .trailing])
                    TextField("Ex: imagem1", text: $name)
                        .padding(16.0)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(20)
                }
                VStack(alignment: .leading){
                    Text("Nome:")
                        .padding([.top, .leading, .trailing])
                    TextField("Ex: Pedro", text: $name)
                        .padding(16.0)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(20)
                }
                Spacer()
            }.padding()
        }
    }
}


extension AddRecipeView{
    private func customPicker(selection: Binding<String>, options: [String]) -> some View{
        return VStack {
            Picker("", selection: selection) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
    }
}

struct AddReceitaView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
