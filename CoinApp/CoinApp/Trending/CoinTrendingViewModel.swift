//
//  CoinTrendingViewModel.swift
//  CoinApp
//
//  Created by 김성률 on 9/11/24.
//

import Foundation

final class CoinTrendingViewModel: ObservableObject {
    
    @Published var top15Coins: [Coins] = []
    
    func fetchTop15Coin() async {
        
        let result = await NetworkManager.shared.requestAPI(req: Router.trending, type: CoinTrendingModel.self)
        print(result)
        
        switch result {
        case .success(let value):
            top15Coins = value.coins
            print(value)
        case .failure(let error):
            print(error)
        }
        
    }
    
}
