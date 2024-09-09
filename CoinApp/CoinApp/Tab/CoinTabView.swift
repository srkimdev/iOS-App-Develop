//
//  CoinTabView.swift
//  CoinApp
//
//  Created by 김성률 on 9/8/24.
//

import SwiftUI

struct CoinTabView: View {
    var body: some View {
        TabView {
            
            CoinTrendingView()
                .tabItem {
                    Image(systemName: "chartchart.line.uptrend.xyaxis")
                }
            
            CoinSearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            CoinStarView()
                .tabItem {
                    Image(systemName: "")
                }
            
            CoinChartView()
                .tabItem {
                    Image(systemName: "person")
                }
            
        }
    }
}

#Preview {
    CoinTabView()
}
