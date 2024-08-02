//
//  CCTVViewModel.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/7/30.
//

import SwiftUI
import Combine

class CCTVViewModel: ObservableObject {
    @Published var cctvList: [CCTVDto] = []
    @Published var favoriteCCTVList:[CCTVDto] = []
    @Published var errorMessage: String?
    @Published var searchText: String = ""
    private let storageManager = UserDefaultsManager()
    
    
    private let apiClient = APIClient()
    
    init(){
        loadFavoriteCCTVList()
    }
    
    var filteredCctvList: [CCTVDto] {
        if searchText.isEmpty {
            return cctvList
        } else {
            return cctvList.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func fetchCCTV() {
        apiClient.fetchCCTV { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let cctvArray):
                    self.cctvList = cctvArray.sortedByDistance(from: LocationManager.getCurrentLocation())
                case .failure(let error):
                    self.errorMessage = "Failed to fetch CCTV data: \(error.localizedDescription)"
                }
            }
        }
    }
    
    private func loadFavoriteCCTVList() {
        favoriteCCTVList = storageManager.loadFavoriteCCTVList()
    }
    
    func insertFavoriteCCTV(cctv: CCTVDto) {
        storageManager.insertFavoriteCCTV(cctv)
        loadFavoriteCCTVList()
    }
    
    func deleteFavoriteCCTV(cctv:CCTVDto){
        storageManager.deleteFavoriteCCTV(cctv)
        loadFavoriteCCTVList()
    }
    
    func isFavoriteCCTV(cctv: CCTVDto) -> Bool {
        return favoriteCCTVList.contains { existingCCTV in
            existingCCTV.id == cctv.id
        }
    }
}
