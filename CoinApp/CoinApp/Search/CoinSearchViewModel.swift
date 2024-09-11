//
//  CoinSearchViewModel.swift
//  CoinApp
//
//  Created by 김성률 on 9/11/24.
//

import Foundation
import Combine

final class CoinSearchViewModel: ObservableObject {
    
    var coins: [Coin] = []
    @Published var filteredCoins: [Coin] = []
    
    var input = Input()
    @Published
    var output = Output()
    
    var cancellables = Set<AnyCancellable>()
    
    struct Input {
        let viewOnTask = PassthroughSubject<Void, Never>()
        let inputText = PassthroughSubject<String, Never>()
    }
    
    struct Output {
        var coins: [Coin] = []
        var filteredCoins: [Coin] = []
    }
    
    init() {
        input
            .viewOnTask
            .sink { [weak self] _ in
                guard let self else { return }
                
                Task {
                    await self.fetchSearchCoin()
                }
                
            }
            .store(in: &cancellables)
        
        input
            .inputText
            .sink { [weak self] value in
                guard let self else { return }
                
                filteredCoins = value.isEmpty ? coins : coins.filter { $0.name.contains(value) }

            }
            .store(in: &cancellables)
    }
    
    func fetchSearchCoin() async {
        
        let result = await NetworkManager.shared.requestAPI(req: Router.search, type: CoinSearchModel.self)
        
        switch result {
        case .success(let value):
            DispatchQueue.main.async {
                self.coins = value.coins
                self.filteredCoins = value.coins
            }
        case .failure(let error):
            print(error)
        }
        
    }
    
}
