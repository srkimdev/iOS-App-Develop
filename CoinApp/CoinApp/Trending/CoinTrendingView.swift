//
//  CoinTrendingView.swift
//  CoinApp
//
//  Created by 김성률 on 9/8/24.
//

import SwiftUI

struct CoinTrendingView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @StateObject private var viewModel = CoinTrendingViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                MyFavoriteListView()
                
                topListView(coins: viewModel.top15Coins)
                
                topListView(coins: viewModel.top15Coins)
            }
            .navigationTitle("Crypto Coin")
        }
        .task {
            await viewModel.fetchTop15Coin()
            print("here")
        }
        
    }
    
    func MyFavoriteListView() -> some View {
        
        VStack(alignment: .leading) {
            Text("My Favorite")
                .font(.title2)
                .bold()
                .padding(.bottom, 5)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(0..<5) { item in
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(width: 230, height: 180)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(5)
                    }
                }
                
            }
        }
        .padding()
        
    }
    
    func topListView(coins: [Coins]) -> some View {
        
        VStack(alignment: .leading) {
            Text("Top 15 Coin")
                .font(.title2)
                .bold()
                .padding(.bottom, 5)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: columns, spacing: 10) {
                    ForEach(coins, id: \.self) { item in
                        rankingRowView(item)
                    }
                }
            }
        }
        .padding()
        
    }
    
    func rankingRowView(_ item: Coins) -> some View {
        
        HStack {
            Text("1")
                .font(.title2)
                .bold()
            
            AsyncImage(url: URL(string: item.item.small))
                .padding()
            
            VStack(alignment: .leading) {
                Text(item.item.name)
                
                Text(item.item.id)
            }

            Spacer()
            
            VStack(alignment: .trailing) {
                Text("$\(item.item.data.price)")
                Text("\(item.item.data.price_change_percentage_24h.krw)")
            }
            .padding(.trailing, 30)
        }

    }
    
}

#Preview {
    CoinTrendingView()
}
