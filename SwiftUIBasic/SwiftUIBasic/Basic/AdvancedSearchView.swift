//
//  AdvancedSearchView.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/3/24.
//

import SwiftUI

struct AdvancedSearchView: View {
    
    @State private var text = ""
    @State private var market: Markets = []
    
    var filterCoin: Markets {
        return text.isEmpty ? market : market.filter { $0.englishName.contains(text) }
    }
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                listView()
            }
            .navigationTitle("Search")
            .searchable(text: $text, placement: .navigationBarDrawer, prompt: "Search")
            
        }
        .onAppear {
            UpbitAPI.fetchAllMarket { data in
                market = data
            }
        }
        
    }
    
    func listView() -> some View {
        LazyVStack {
            ForEach(filterCoin, id: \.self) { item in
                rowView(item)
            }
        }
    }
    
    func rowView(_ item: Market) -> some View {
        HStack {
            
            Circle()
                .fill()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(item.englishName)
                Text(item.market)
            }
            
            Spacer()
            
            Image(systemName: "star")
        }
        .padding()
    }
    
}


#Preview {
    AdvancedSearchView()
}
