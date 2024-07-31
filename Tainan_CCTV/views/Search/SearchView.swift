//
//  SearchView.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/7/30.
//

import SwiftUI


struct SearchView: View {
    @StateObject private var viewModel = CCTVViewModel()
    
    var body: some View {
        NavigationView {
            CCTVList(cctvList:viewModel.cctvList, errorMessage:viewModel.errorMessage)
        }
        .onAppear {
            viewModel.fetchCCTV()
        }
    }
}
