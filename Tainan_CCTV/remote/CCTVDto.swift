//
//  CCTVDto.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/7/30.
//

struct CCTVDto: Codable {
    let id: String
    let name: String
    let longitude: String // 對應 JSON 中的 `wgsx`
    let latitude: String  // 對應 JSON 中的 `wgsy`
    let url: String
    let source: String
    let updateTime: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case longitude = "wgsx"
        case latitude = "wgsy"
        case url
        case source
        case updateTime
    }
}
