//
//  UserDefaultsManager.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/8/1.
//

import Foundation


class UserDefaultsManager {
    private let favoriterCCTVKey = "favoriteCCTV"
    
    func insertFavoriteCCTV(_ cctv: CCTVDto) {
        var cctvList = loadFavoriteCCTVList()
        
        if !cctvList.contains(where: { existingCCTV in
            existingCCTV.id == cctv.id
        }) {
            cctvList.append(cctv)
            saveFavoriteCCTVList(cctvList)
        }
    }
    
    func deleteFavoriteCCTV(_ cctv: CCTVDto) {
        var cctvList = loadFavoriteCCTVList()
        
        
        if let index = cctvList.firstIndex(where: { $0.id == cctv.id }) {
            cctvList.remove(at: index)
            saveFavoriteCCTVList(cctvList)
        }
    }
    
    private func saveFavoriteCCTVList(_ cctvList: [CCTVDto]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(cctvList) {
            UserDefaults.standard.set(encoded, forKey: favoriterCCTVKey)
        }
    }
    
    func loadFavoriteCCTVList() -> [CCTVDto] {
        if let savedCCTVData = UserDefaults.standard.data(forKey: favoriterCCTVKey) {
            let decoder = JSONDecoder()
            if let loadedCCTVList = try? decoder.decode([CCTVDto].self, from: savedCCTVData) {
                return loadedCCTVList
            }
        }
        return []
    }
}
