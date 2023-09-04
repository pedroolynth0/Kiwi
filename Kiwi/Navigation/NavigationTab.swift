//
//  MainView.swift
//  Kiwi
//
//  Created by dti digital on 29/08/23.
//

import SwiftUI


struct NavigationTab: View {

    var body: some View {
        TabView{
                HomeView()
                    .tabItem{
                            Image(systemName: "house")
                                .frame(width: 10,height: 10)
                            Text("Home")
                    }
                AddReceitaView()
                    .tabItem{
                        Label("Teste", systemImage: "square")
                    }
            
        }
        .accentColor(.blue)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTab()
    }
}
