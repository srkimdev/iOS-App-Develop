//
//  CoinSearchModel.swift
//  CoinApp
//
//  Created by 김성률 on 9/8/24.
//

import Foundation

struct CoinSearchModel: Decodable {
    let coins: [Coin]
}

struct Coin: Decodable, Hashable {
    let id: String
    let name: String
    let symbol: String
    let thumb: String
}
