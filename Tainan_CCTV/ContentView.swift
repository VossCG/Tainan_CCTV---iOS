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
            List {
                if viewModel.cctvList.isEmpty && viewModel.errorMessage == nil {
                    Text("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    ForEach(viewModel.cctvList, id: \.id) { cctv in
                        NavigationLink(destination: CCTVDetailView(cctv: cctv)) {
                            Text(cctv.name)
                        }
                    }
                }
            }
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
