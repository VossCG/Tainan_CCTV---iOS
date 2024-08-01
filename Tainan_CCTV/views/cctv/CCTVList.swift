//
//  CCTVList.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/7/30.
//

import SwiftUI

struct CCTVList: View {
    
    let cctvList:[CCTVDto]
    let errorMessage:String?
    
    var body: some View {
        if let errorMessage = errorMessage{
            Spacer()
            Text("Error: \(errorMessage)")
                .foregroundColor(.red)
            Spacer()
        }
        else {
            List{
                ForEach(cctvList, id: \.id) { cctv in
                    NavigationLink(destination: CCTVDetailView(cctv: cctv)) {
                        Text(cctv.name).lineLimit(1).truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                    }
                }
            }.listStyle(.inset)
        }
    }
}
