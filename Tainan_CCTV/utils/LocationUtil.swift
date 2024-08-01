//
//  LocationUtil.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/8/1.
//

import Foundation
import CoreLocation

class LocationUtils {
    
    static func findClosestCCTVs(toLatitude latitude: CLLocationDegrees, longitude: CLLocationDegrees, cctvList: [CCTVDto]) -> [CCTVDto] {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        let sortedCCTVs = cctvList.sorted { (cctv1, cctv2) -> Bool in
            guard let lat1 = Double(cctv1.latitude), let lon1 = Double(cctv1.longitude),
                  let lat2 = Double(cctv2.latitude), let lon2 = Double(cctv2.longitude) else {
                return false
            }
            
            let location1 = CLLocation(latitude: lat1, longitude: lon1)
            let location2 = CLLocation(latitude: lat2, longitude: lon2)
            
            let distance1 = location.distance(from: location1)
            let distance2 = location.distance(from: location2)
            
            return distance1 < distance2
        }
        
        return Array(sortedCCTVs.prefix(2))
    }
}
