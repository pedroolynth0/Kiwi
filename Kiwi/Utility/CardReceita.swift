//
//  CardReceita.swift
//  Kiwi
//
//  Created by dti digital on 29/08/23.
//

import SwiftUI

struct CardReceita: View {
    var receita : Receita
    var body: some View {
        ZStack{
            //MARK: -3. Low
            GeometryReader{ geometry in
                Image(receita.imagem)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(20.0)
                    
                    
                
                VStack {
                    Spacer()
                    Text(receita.nome)
                        .fontWeight(.bold)
                        .font(.system(size:36))
                        .multilineTextAlignment(.center)
                        .padding(30)
                    
                }.foregroundColor(Color.white)
                
            }
            
            
        }
        
    }
}

struct CardReceita_Previews: PreviewProvider {
    static var previews: some View {
        
        CardReceita(receita: ReceitaData().receitas[0])
    }
}
