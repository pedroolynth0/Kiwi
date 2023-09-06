//
//  ReceitaData.swift
//  Kiwi
//
//  Created by dti digital on 30/08/23.
//

import Foundation


struct RecipeData{
    var recipes =
    [
        Recipe(name: "Pizza Margherita Tradicional", category: "Pizza", description: "Uma pizza clássica e deliciosa com molho de tomate, queijo mozzarella e manjericão fresco.", image: "margherita", steps: ["Pré-aqueça o forno a 220°C.",
            "Estique a massa de pizza em uma superfície enfarinhada até obter o tamanho desejado.",
            "Transfira a massa esticada para uma assadeira levemente untada.",
            "Espalhe uma camada generosa de molho de tomate sobre a massa, deixando uma borda fina ao redor.",
            "Cubra o molho com queijo mozzarella ralado.",
            "Asse a pizza no forno pré-aquecido por cerca de 10-12 minutos, ou até que a massa fique dourada e o queijo derreta e borbulhe.",
            "Enquanto a pizza assa, lave e seque as folhas de manjericão.",
            "Retire a pizza do forno e, imediatamente, coloque as folhas de manjericão por cima.",
            "Tempere com um fio de azeite de oliva extra virgem e uma pitada de sal e pimenta a gosto.",
            "Corte a pizza em fatias, sirva quente e aproveite!"],
          ingredients: ["Massa de pizza fresca", "Molho de tomate", "Queijo mozzarella ralado", "Folhas de manjericão fresco", "Azeite de oliva extra virgem", "Sal e pimenta a gosto"],
          difficulty: "Fácil", time: "30 mins"),

        
        Recipe(name: "Sanduiche de Abacate", category: "Fast-Food", description:"Este sanduíche é uma explosão de sabores frescos e texturas crocantes. É perfeito para um almoço rápido e saudável ou para qualquer ocasião em que você deseja um sanduíche delicioso e nutritivo. Aproveite!" ,image: "sanduiche-abacate", steps: ["Tempere os peitos de frango com sal, pimenta e um fio de azeite de oliva. Grelhe-os até que fiquem dourados e cozidos por completo. Reserve.","Enquanto o frango está na grelha, corte o abacate e o tomate em fatias finas. Lave e seque as folhas de alface.","Escolha o pão que preferir e, se desejar, toste levemente","Para montar o sanduíche, comece com uma camada de alface fresca no pão tostado.","Coloque o peito de frango grelhado por cima da alface.","Em seguida, adicione fatias de abacate e tomate.","Regue o sanduíche com o molho de iogurte com ervas (ou o molho de sua escolha) para um toque final de sabor.","Feche o sanduíche com a outra metade do pão, pressione levemente e corte ao meio."], ingredients: ["Peitos de frango desossados e sem pele","Abacate maduro","Tomate vermelho","Alface fresca", "Pão de sua escolha (pode ser integral, ciabatta, ou outro)",
     "Molho de iogurte com ervas (ou seu molho favorito)","Sal e pimenta a gosto","Azeite de oliva"], difficulty: "Hard", time: "10 mins"),
        
        Recipe(name: "Macarrão à Carbonara", category: "Massa", description: "Uma receita italiana clássica de macarrão com um delicioso molho à base de ovos, queijo parmesão e pancetta.", image: "carbonara", steps: ["Leve uma panela grande de água salgada para ferver.",
            "Enquanto a água ferve, em uma frigideira grande, aqueça um pouco de azeite de oliva e adicione a pancetta picada ou bacon. Cozinhe até ficar crocante.",
            "Em uma tigela grande, bata os ovos e adicione a maior parte do queijo parmesão ralado, reservando um pouco para decorar no final. Tempere com pimenta do reino moída na hora.",
            "Quando a água estiver fervendo, cozinhe o macarrão de acordo com as instruções da embalagem até que fique al dente. Reserve uma xícara da água do cozimento e depois escorra o macarrão.",
            "Enquanto o macarrão ainda estiver quente, misture-o rapidamente na tigela com a mistura de ovos e queijo. A pancetta crocante também pode ser adicionada nesta etapa.",
            "Adicione um pouco da água do cozimento reservada à mistura para obter a consistência desejada do molho.",
            "Sirva o macarrão à carbonara em pratos quentes, polvilhe com o queijo parmesão restante e um pouco de pimenta moída na hora. Aproveite!"],
          ingredients: ["Macarrão (como espaguete ou fettuccine)", "Pancetta picada ou bacon", "Ovos", "Queijo parmesão ralado", "Azeite de oliva", "Pimenta do reino moída na hora", "Sal"],
          difficulty: "Média", time: "20 mins"),
        
        Recipe(name: "Sanduíche de Salmão Defumado", category: "Fast-Food", description: "Este é um sanduíche de salmão defumado com um toque de mostarda e mel, perfeito para um almoço rápido e saboroso!", image: "sanduiche-salmao", steps: ["Comece preparando o molho de mostarda e mel misturando uma colher de mostarda Dijon com duas colheres de mel. Reserve.",
          "Corte o pão de centeio em fatias finas e toste levemente no forno ou na torradeira.",
          "Enquanto o pão está tostando, fatie finamente o salmão defumado e reserve.",
          "Lave e seque o agrião para a base do seu sanduíche.",
          "Quando o pão estiver pronto, retire-o do forno e espalhe o molho de mostarda e mel em uma das fatias.",
          "Em seguida, coloque as fatias de salmão defumado sobre o molho.",
          "Adicione o agrião lavado por cima do salmão.",
          "Feche o sanduíche com outra fatia de pão tostado e pressione levemente.",
          "Corte ao meio e sirva."],
          ingredients: ["Pão de centeio","Salmão defumado","Agrião fresco","Mostarda Dijon","Mel"],
          difficulty: "Média", time: "15 mins")

    ]
}
