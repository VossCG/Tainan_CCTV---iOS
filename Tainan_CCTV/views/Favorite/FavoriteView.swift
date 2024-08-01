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
                List(cctvViewModel.favoriteCCTVList, id: \.id) { cctv in
                    HStack {
                        NavigationLink(destination: CCTVDetailView(cctv: cctv)){
                            Text(cctv.name)
                                .lineLimit(1)
                                .truncationMode(.tail)
                            Spacer()
                        }
                        Button(action: {
                            cctvViewModel.insertFavoriteCCTVDto(cctv: cctv)
                        }, label: {
                            Image(systemName: "star.fill")
                        }).buttonStyle(PlainButtonStyle())
                    }
                }.listStyle(.plain)
            })
            .navigationTitle("我的最愛")
        }
    }
}
