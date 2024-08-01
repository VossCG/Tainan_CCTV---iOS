//
//  ContentView.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/7/29.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CCTVViewModel()
    
    var body: some View {
        NavigationView {
            CCTVList(cctvList:viewModel.cctvList, errorMessage:viewModel.errorMessage)
            .navigationTitle("CCTV")
        }
        .onAppear {
            viewModel.fetchCCTV()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
