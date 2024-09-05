//
//  UpbitAPI.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/3/24.
//

import SwiftUI

struct Market: Hashable, Codable {
    let market: String
    let koreanName: String
    let englishName: String
    var like: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}

struct MarketLike: Hashable {
    let like: Bool
}

typealias Markets = [Market]

struct UpbitAPI {
    
    private init() { }
    
    static func fetchAllMarket(completion: @escaping ([Market]) -> Void) {
        
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(Markets.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
