//
//  CCTVDto.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/7/30.
//

import Foundation
import CoreLocation

struct CCTVDto: Codable,Comparable {
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
    
    static func < (lhs: CCTVDto, rhs: CCTVDto) -> Bool {
        lhs.name < rhs.name
    }
    
}


extension Array where Element == CCTVDto {
    func sortedByDistance(from coordinate: CLLocationCoordinate2D) -> [CCTVDto] {
        return self.sorted { cctv1, cctv2 in
            let coord1 = CLLocationCoordinate2D(latitude: Double(cctv1.latitude) ?? 0, longitude: Double(cctv1.longitude) ?? 0)
            let coord2 = CLLocationCoordinate2D(latitude: Double(cctv2.latitude) ?? 0, longitude: Double(cctv2.longitude) ?? 0)
            return LocationUtils.distance(from: coordinate, to: coord1) < LocationUtils.distance(from: coordinate, to: coord2)
        }
    }
}

