//
//  ForMeView.swift
//  Kiwi
//
//  Created by dti digital on 05/09/23.
//

import SwiftUI

struct ForMeView: View {
    let receitaData = ReceitaData().receitas
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing: 20){
                Text("For Me")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    
                
                HStack(){
                    Button(action: {
                        // Ação a ser executada quando o botão for pressionado
                        print("Botão pressionado!")
                    }) {
                        HStack {
                            Image(systemName: "mug.fill") // Substitua pela sua imagem
                                .foregroundColor(.blue)
                                .font(.callout)
                                .padding(.leading)
                            
                            Text("Café da manhã")
                                .font(.caption)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(.all, 5.0)
                        .foregroundColor(.black)
                        .frame(width: 170,height: 30)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(5)
                    }
                    
                    Button(action: {
                        // Ação a ser executada quando o botão for pressionado
                        print("Botão pressionado!")
                    }) {
                        HStack {
                            Image(systemName: "fork.knife") // Substitua pela sua imagem
                                .foregroundColor(.blue)
                                .font(.callout)
                                .padding(.leading)
                            
                            Text("Almoço")
                                .font(.caption)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(.all, 5.0)
                        .foregroundColor(.black)
                        .frame(width: 170,height: 30)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(5)
                    }
                }
                
                HStack(){
                    Button(action: {
                        // Ação a ser executada quando o botão for pressionado
                        print("Botão pressionado!")
                    }) {
                        HStack {
                            Image(systemName: "carrot.fill") // Substitua pela sua imagem
                                .foregroundColor(.blue)
                                .font(.callout)
                                .padding(.leading)
                            
                            Text("Jantar")
                                .font(.caption)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(.all, 5.0)
                        .foregroundColor(.black)
                        .frame(width: 170,height: 30)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(5)
                    }
                    
                    Button(action: {
                        // Ação a ser executada quando o botão for pressionado
                        print("Botão pressionado!")
                    }) {
                        HStack {
                            Image(systemName: "takeoutbag.and.cup.and.straw.fill") // Substitua pela sua imagem
                                .foregroundColor(.blue)
                                .font(.callout)
                                .padding(.leading)
                            
                            Text("Lanche")
                                .font(.caption)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .foregroundColor(.black)
                        .frame(width: 170,height: 30)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(5)
                    }
                }
                
               Divider()
                
                HStack{
                    Text("Comidas Saudaveis")
                        .font(.title3)
                        .fontWeight(.bold)
                        Spacer()
                    Button(action: {
                        // Ação a ser executada quando o botão for pressionado
                        print("Botão pressionado!")
                    }) {
                        Text("Ver mais")
                            .font(.caption)
                            .padding(5)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(15)
                    }
                }
                ScrollView(.horizontal,showsIndicators: false){
                    //Navigation Stack
                    HStack {
                        ForEach(receitaData , id: \.uniqueID){ receita in
                            NavigationLink(destination: ReceitaDetalhesView(receita: receita)) {
                                CardReceitaView(receita: receita)
                                    .frame(width: 150,height: 250)
                            }
                            
                        }
                    }
                }
                
            }
            .padding()
            Spacer()
        }
        
    }
}

struct ForMeView_Previews: PreviewProvider {
    static var previews: some View {
        ForMeView()
    }
}
