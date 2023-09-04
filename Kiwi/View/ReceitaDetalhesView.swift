//
//  ReceitaDetalhesView.swift
//  Kiwi
//
//  Created by dti digital on 31/08/23.
//

import SwiftUI

struct ReceitaDetalhesView: View {
    var receita: Receita
    
    var body: some View {
        
        ScrollView(){
            ResizedImage(imageName: receita.imagem, maxHeight: 300)
            HStack {
                VStack {

                    Text("Ingredientes")
                        .font(.body)
                        .fontWeight(.bold)
                    
                    ForEach(receita.ingredientes, id: \.self) { ingrediente in
                        Text(ingrediente)
                    }
                }
                .edgesIgnoringSafeArea(.vertical)
                Spacer()
            }
            
        }
    }
}

struct ResizedImage: View {
    var imageName: String
    var maxHeight: CGFloat
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            
            .frame(maxHeight: maxHeight)
            .clipped()
            
            
    }
}
struct ReceitaDetalhesView_Previews: PreviewProvider {
    static var previews: some View {
        ReceitaDetalhesView(receita: ReceitaData().receitas[0])
    }
}
