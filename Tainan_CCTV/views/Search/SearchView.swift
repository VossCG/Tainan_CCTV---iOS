//
//  SearchView.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/7/30.
//

import SwiftUI


struct SearchView: View {
    @ObservedObject var cctvViewModel:CCTVViewModel
    
    var body: some View {
        VStack{
            SearchBar(text: $cctvViewModel.searchText)
            
            if let errorMessage = cctvViewModel.errorMessage{
                Spacer()
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                Spacer()
            }
            else {
                List(cctvViewModel.filteredCctvList,id: \.id){cctv in
                    HStack {
                        Text(cctv.name)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .swipeActions(edge:.trailing){
                                Button(action: {
                                    cctvViewModel.insertFavoriteCCTVDto(cctv: cctv)
                                }, label: {
                                    Image(systemName: "star")
                                }).tint(.green)
                            }
                    }
                    
                }.listStyle(.plain)
            }
        }
    }
}
