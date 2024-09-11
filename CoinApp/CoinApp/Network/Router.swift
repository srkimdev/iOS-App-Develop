//
//  Router.swift
//  CoinApp
//
//  Created by 김성률 on 9/8/24.
//

import Foundation
import Alamofire

enum Router {
    
    case trending
    case search
    case market(vsCurrency: String, ids: String)
    
    var baseURL: String {
        return "https://api.coingecko.com/api/v3/"
    }
    
    var endPoint: String {
        switch self {
        case .trending:
            return baseURL + "search/trending"
        case .search:
            return baseURL + "search"
        case .market:
            return baseURL + "coins/markets"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .trending:
            return nil
        case .search:
            var parameters: Parameters = [
                "query": "bitcoin"
            ]
            return parameters
        case .market(let vsCurrency, let ids):
            var parameters: Parameters = [
                "vs_currency": vsCurrency,
                "ids": ids
            ]
            return parameters
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
}
