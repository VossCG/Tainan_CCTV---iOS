//
//  SearchView.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/7/30.
//

import SwiftUI


struct SearchView: View {
    @ObservedObject var cctvViewModel:CCTVViewModel
    @State private var currentLocation = LocationManager.getCurrentLocation()
    @State private var showingToast = false
    @State private var toastMessage = ""
    
    
    var body: some View {
        NavigationView{
            VStack{
                SearchBar(text: $cctvViewModel.searchText).padding(8)
                List(cctvViewModel.filteredCctvList.sortedByDistance(from: currentLocation)
                     ,id: \.id){cctv in
                    HStack {
                        NavigationLink(destination: CCTVDetailView(cctv: cctv)){
                            Label(cctv.name,systemImage: "location.circle")
                                .padding(8)
                                .lineLimit(1)
                                .truncationMode(.tail)
                                .swipeActions(edge:.trailing){
                                    Button(action: {
                                        if cctvViewModel.isFavoriteCCTV(cctv: cctv) {
                                            toastMessage = "已加入最愛"
                                            showingToast = true
                                        } else {
                                            cctvViewModel.insertFavoriteCCTV(cctv: cctv)
                                        }
                                    }, label: {
                                        Image(systemName: "star")
                                    }).tint(.green)
                                }
                        }
                    }
                }.listStyle(.plain)
            }
        }
        .listRowBackground(Color.clear)
        .toast(isShow: $showingToast,info: toastMessage)
    }
}
