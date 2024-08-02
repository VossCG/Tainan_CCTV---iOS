//
//  HomeView.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/7/30.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var cctvViewModel: CCTVViewModel
    @State private var closestCCTVs: [CCTVDto] = []
    @State private var currentLocation = LocationManager.getCurrentLocation()
    
    var body: some View {
        VStack(spacing: 0) {
            
            if let errorMessage = cctvViewModel.errorMessage{
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }else if cctvViewModel.cctvList.isEmpty{
                ProgressView()
                    .scaleEffect(3.0)
            }else {
                LazyVStack(spacing: 12) {
                    ForEach(closestCCTVs, id: \.id) { cctv in
                        VStack(alignment: .leading) {
                            Text("\(cctv.name)")
                                .lineLimit(1)
                                .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                            if let url = URL(string: cctv.url) {
                                WebView(url: url)
                                    .aspectRatio(1.475, contentMode: .fit)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                }.padding()
            }
        }.onReceive(cctvViewModel.$cctvList) { cctvList in
            if !cctvList.isEmpty {
                closestCCTVs = Array(cctvList.prefix(2))
            }
        }
    }
    
}
