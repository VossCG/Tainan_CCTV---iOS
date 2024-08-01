//
//  HomeViewModel.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/7/31.
//

import Foundation
import CoreLocation
import Combine
import SwiftUI

class HomeViewModel:ObservableObject{
    
    @Published var latitude: CLLocationDegrees = 0.0
    @Published var longitude: CLLocationDegrees = 0.0
    private var locationManager = LocationManager()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        refreshLocation()
    }
    
    func refreshLocation(){
        locationManager.$location
            .compactMap { $0 }
            .sink { [weak self] location in
                self?.latitude = location.coordinate.latitude
                self?.longitude = location.coordinate.longitude
            }
            .store(in: &cancellables)
    }
}
