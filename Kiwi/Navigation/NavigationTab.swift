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
                ForMeView()
                    .tabItem{
                            Image(systemName: "smiley.fill")
                                .frame(width: 10,height: 10)
                            Text("For me")
                    }
                HomeView()
                    .tabItem{
                        Label("Pesquisar", systemImage: "magnifyingglass")
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
