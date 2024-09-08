//
//  CoinSearchView.swift
//  CoinApp
//
//  Created by 김성률 on 9/8/24.
//

import SwiftUI

struct CoinSearchView: View {
    
    @State private var searchText = ""
    @State private var coins: [Coin] = []
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(coins, id: \.self) { item in
                        coinRowView(item)
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText)
        }
        .task {
            let result = await NetworkManager.shared.requestAPI(req: Router.search, type: CoinSearchModel.self)
            
            switch result {
            case .success(let value):
                coins = value.coins
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    func coinRowView(_ coin: Coin) -> some View {

        HStack {
            AsyncImage(url: URL(string: coin.thumb)) { data in
                switch data {
                case .empty:
                    ProgressView()
                        .frame(width: 40, height: 40)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                case .failure(let error):
                    Image(systemName: "star")
                        .frame(width: 40, height: 40)
                }
            }
            .padding()
            
            VStack {
                Text(coin.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                Text(coin.id)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            
            Spacer()
            
            Button(action: {
                print("star button click")
            }, label: {
                Image(systemName: "star")
            })
        }
        .padding(.horizontal)
            
    }
    
}

#Preview {
    CoinSearchView()
}
