//
//  APIClient.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/7/30.
//

import Foundation

class APIClient {
    func fetchCCTV(completion: @escaping (Result<[CCTVDto], Error>) -> Void) {
        let url = URL(string: "https://tntcc.tainan.gov.tw/api/cctvs")! // 替換為你的實際 API URL
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "dataNilError", code: -1001, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601 // 處理 ISO 8601 格式的日期
                            
                let cctvArray = try decoder.decode([CCTVDto].self, from: data)
                completion(.success(cctvArray))
            } catch {
                print("Decoding Error: \(error.localizedDescription)") // 打印解碼錯誤
                completion(.failure(error))
            }
        }.resume()
    }
}
