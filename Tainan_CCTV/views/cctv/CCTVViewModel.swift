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
    @Published var errorMessage: String?

    private let apiClient = APIClient()
    
    func fetchCCTV() {
        apiClient.fetchCCTV { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let cctvArray):
                    self.cctvList = cctvArray
                case .failure(let error):
                    print(error.localizedDescription)
                    self.errorMessage = "Failed to fetch CCTV data: \(error.localizedDescription)"
                }
            }
        }
    }
}
