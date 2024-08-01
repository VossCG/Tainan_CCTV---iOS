//
//  CCTVDetailView.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/7/30.
//

import SwiftUI


struct CCTVDetailView: View {
    let cctv: CCTVDto
    var body: some View {

        VStack(alignment: .leading,spacing: 6) {
            if let url = URL(string: cctv.url) {
                WebView(url: url)
                    .aspectRatio(1.475, contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding(.bottom,12)
                
            }
            Text("\(cctv.name)").bold()
            
            Text("經度：\(cctv.longitude) , 緯度：\(cctv.latitude)")
                .font(.caption2)
                .padding(.top,12)
            
            Text("更新時間: \(cctv.updateTime)").font(.caption)
        }
        .padding()
        
        
    }
}


struct CCTVDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let cctv = CCTVDto(
            id: "C108002",
            name: "金華路三段與府前路二段口(南桿)",
            longitude: "120.19274",
            latitude: "22.991336",
            url: "https://trafficvideo.tainan.gov.tw/172021002100",
            source: "TNC",
            updateTime: "2024-07-30T15:35:47+08:00"
        )
        CCTVDetailView(cctv: cctv)
    }
}
