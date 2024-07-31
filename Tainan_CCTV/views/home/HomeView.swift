//
//  HomeView.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/7/30.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
            VStack(spacing: 0) {
                HStack {
                    Text("我的位置").padding()
                    Spacer()
                    Button(action: {}){
                        Image(systemName: "location.magnifyingglass").padding()
                    }
                    Button(action: {}){
                        Image(systemName: "location").padding()
                    }
                    Button(action: {}){
                        Image(systemName: "arrow.clockwise").padding()
                    }
                }
                Spacer()
                Text(Constants.TEST_CCTV_NAME)
                if let url = URL(string: Constants.TEST_CCTV_URL) {
                    WebView(url: url)
                        .aspectRatio(1.475, contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding(12)
                    
                }
                Text(Constants.TEST_CCTV_NAME)
                if let url = URL(string: Constants.TEST_CCTV_URL) {
                    WebView(url: url)
                        .aspectRatio(1.475, contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding(12)
                    
                }
                Spacer()
            }
          
        }
}



#Preview {
    HomeView()
}
