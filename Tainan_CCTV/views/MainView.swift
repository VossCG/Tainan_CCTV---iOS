//
//  MainView.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/7/30.
//

import SwiftUI

struct MainView: View {
    var body: some View {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                
                FavoriteView()
                    .tabItem {
                        Image(systemName: "star.fill")
                    }
            }
        }
}

#Preview {
    MainView()
}
