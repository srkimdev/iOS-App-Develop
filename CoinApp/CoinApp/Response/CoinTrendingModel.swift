//
//  CoinTrendingModel.swift
//  CoinApp
//
//  Created by 김성률 on 9/11/24.
//

import Foundation

struct CoinTrendingModel: Decodable, Hashable {
    let coins: [Coins]
    let nfts: [Nft]
}

struct Coins: Decodable, Hashable {
    let item: Item
}

struct Item: Decodable, Hashable {
    let id: String
    let name: String
    let symbol: String
    let small: String
    let data: Price
}

struct Price: Decodable, Hashable {
    let price: Double
    let price_change_percentage_24h: Currencys
}

struct Currencys: Decodable, Hashable {
    let krw: Double
}

struct Nft: Decodable, Hashable {
    let name: String
    let symbol: String
    let thumb: String
    let data: Floor
}

struct Floor: Decodable, Hashable {
    let floor_price: String
    let floor_price_in_usd_24h_percentage_change: String
}
