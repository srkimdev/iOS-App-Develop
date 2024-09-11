//
//  CoinTrendingViewModel.swift
//  CoinApp
//
//  Created by 김성률 on 9/11/24.
//

import Foundation

final class CoinTrendingViewModel: ObservableObject {
    
    @Published var top15Coins: [Coins] = []
    @Published var nft7Coins: [Nft] = []
    
    func fetchCoin() async {
        
        let result = await NetworkManager.shared.requestAPI(req: Router.trending, type: CoinTrendingModel.self)
        
        switch result {
        case .success(let value):
            
            DispatchQueue.main.async {
                self.top15Coins = value.coins
                self.nft7Coins = value.nfts
            }

        case .failure(let error):
            print(error)
        }
        
    }
    
}
