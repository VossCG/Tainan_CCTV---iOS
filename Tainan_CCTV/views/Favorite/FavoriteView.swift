//
//  FavoriteView.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/7/30.
//
import SwiftUI


struct FavoriteView: View {
    
    @ObservedObject var cctvViewModel:CCTVViewModel
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, content: {
                List{
                    ForEach(cctvViewModel.favoriteCCTVList.sorted(), id: \.id) { cctv in
                        NavigationLink(destination: CCTVDetailView(cctv: cctv)) {
                            Label(cctv.name,systemImage: "location.circle")
                                .padding(8)
                                .lineLimit(1)
                                .truncationMode(.tail)
                            
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            let sortedList = cctvViewModel.favoriteCCTVList.sorted()
                            let removeCCTV = sortedList[index]
                            cctvViewModel.deleteFavoriteCCTV(cctv: removeCCTV)
                        }
                    }
                }
                .listStyle(.plain)
                
            }).navigationTitle("Collections")
        }
    }
}
