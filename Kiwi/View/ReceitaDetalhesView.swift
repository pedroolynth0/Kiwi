import SwiftUI

struct ReceitaDetalhesView: View {
    var receita: Receita
    
    var body: some View {
        
        ScrollView{
            
            VStack(alignment: .center, spacing: 20) {
                GeometryReader{
                    geometry in
                    Image(receita.imagem)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width,height: geometry.size.height)
                        .ignoresSafeArea()
                        .clipped()
                }
                .frame(height: 250)
                
                VStack(alignment: .leading,spacing: 20) {
                    //MARK: Titulo
                    HStack {
                        VStack (alignment: .leading){
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
                    
                    Text("Descrição")
                        .font(.title3)
                        .fontWeight(.bold)
                    
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
