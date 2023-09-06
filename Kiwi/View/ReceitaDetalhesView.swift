import SwiftUI

struct ReceitaDetalhesView: View {
    var receita: Receita
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .center, spacing: 20) {
                GeometryReader {
                    geometry in
                    Image(receita.imagem)
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
                            Text(receita.nome)
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
                            Text(receita.tempo)
                        }
                        HStack{
                            Image(systemName: "trophy")
                            Text(receita.dificuldade)
                        }
                    }
                    .font(.callout)
                    .foregroundColor(Color.gray)
                    
                    
                    Text("Descrição")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.vertical, 5.0)
                    
                    Text(receita.descricao)
                        .font(.callout)
                        .foregroundColor(Color.gray)
                    Text("Ingredientes")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.vertical, 5.0)
                    
                        ForEach(receita.ingredientes, id: \.self){ ingrediente in
                            Text("- " + ingrediente)
                                .font(.callout)
                                .foregroundColor(.gray)
                        }
                    Text("Instruções")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.vertical, 5.0)
                    
                    ForEach(0 ..< receita.etapas.count, id: \.self){ contador in
                        
                        Text("\(contador + 1). \(receita.etapas[contador])")
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
        ReceitaDetalhesView(receita: ReceitaData().receitas[1])
    }
}
