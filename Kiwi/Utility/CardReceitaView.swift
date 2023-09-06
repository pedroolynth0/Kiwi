//
//  CardReceita.swift
//  Kiwi
//
//  Created by dti digital on 29/08/23.
//

import SwiftUI

struct CardReceitaView: View {
    var receita : Receita
    var body: some View {

        VStack(alignment: .leading){
            GeometryReader{ geometry in
                Image(receita.imagem)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                .cornerRadius(20.0)
                
            }
            Text(receita.categoria)
                .font(.caption)
                .foregroundColor(.blue)
                .fontWeight(.bold)
            Text(receita.nome)
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black
                )
        }
    }
        
}

struct CardReceitaView_Previews: PreviewProvider {
    static var previews: some View {
        
        CardReceitaView(receita: ReceitaData().receitas[0])
    }
}
