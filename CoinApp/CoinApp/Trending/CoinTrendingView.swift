//
//  CoinTrendingView.swift
//  CoinApp
//
//  Created by 김성률 on 9/8/24.
//

import SwiftUI

struct CoinTrendingView: View {
    
    let rows = [
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
                
                nftListView(nfts: viewModel.nft7Coins)
                
            }
            .navigationTitle("Crypto Coin")
        }
        .task {
            await viewModel.fetchCoin()
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
                LazyHGrid(rows: rows, spacing: 10) {
                    ForEach(Array(coins.enumerated()), id: \.offset) { index, item in
                        top15CoinRowView(index, item)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
        }
        .padding()
        
    }
    
    func nftListView(nfts: [Nft]) -> some View {
        VStack(alignment: .leading) {
            Text("Top 7 NFT")
                .font(.title2)
                .bold()
                .padding(.bottom, 5)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 10) {
                    ForEach(Array(nfts.enumerated()), id: \.offset) { index, item in
                        top7NFTRowView(index, item)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
        }
        .padding()
    }
    
    func top15CoinRowView(_ index: Int, _ item: Coins) -> some View {
        
        HStack {
            Text("\(index + 1)")
                .font(.title2)
                .bold()
            
            AsyncImage(url: URL(string: item.item.small))
                .padding()
            
            VStack(alignment: .leading) {
                Text(item.item.name)
                    .bold()
                Text(item.item.id)
            }

            Spacer()
            
            VStack(alignment: .trailing) {
                Text("$\(String(format: "%.4f", item.item.data.price))")
                
                Text("\(String(format: "%.2f", item.item.data.price_change_percentage_24h.krw))%")
                    .foregroundStyle(item.item.data.price_change_percentage_24h.krw > 0 ? .red : .blue)
            }
            .padding(.trailing, 30)
        }

    }
    
    func top7NFTRowView(_ index: Int, _ item: Nft) -> some View {
        
        HStack {
            Text("\(index + 1)")
                .font(.title2)
                .bold()
            
            AsyncImage(url: URL(string: item.thumb))
                .padding()
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .bold()
                Text(item.symbol)
            }

            Spacer()
            
            VStack(alignment: .trailing) {
                Text("$\(String(format: "%.4f", item.data.floor_price))")
                
                Text("\(String(format: "%.2f", item.data.floor_price_in_usd_24h_percentage_change))%")
                    .foregroundStyle(Double(item.data.floor_price_in_usd_24h_percentage_change)! > 0 ? .red : .blue)
            }
            .padding(.trailing, 30)
        }
        
    }
    
}

//#Preview {
//    CoinTrendingView()
//}
