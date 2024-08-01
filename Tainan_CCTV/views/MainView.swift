//
//  MainView.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/7/30.
//

import SwiftUI

struct MainView: View {
    @StateObject private var cctvViewModel = CCTVViewModel()
    
    var body: some View {
        TabView {
            HomeView(cctvViewModel: cctvViewModel)
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            SearchView(cctvViewModel: cctvViewModel)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            FavoriteView(cctvViewModel: cctvViewModel)
                .tabItem {
                    Image(systemName: "star.fill")
                }
        }.onAppear{
            cctvViewModel.fetchCCTV()
        }
    }
}

#Preview {
    MainView()
}
