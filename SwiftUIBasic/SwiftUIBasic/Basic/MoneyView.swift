//
//  MoneyView.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/4/24.
//

import SwiftUI

struct MoneyView: View {
    
    @State private var money: [Money] = []
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                bannerView()
                listView()
            }
            .refreshable {
                money = dummy.shuffled()
            }
            .navigationTitle("My Money")
        }
        .onAppear {
            money = dummy.shuffled()
        }
        
    }
    
    func bannerView() -> some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.red)
                .overlay(alignment: .leading) {
                    Circle()
                        .fill(.yellow)
                        .overlay {
                            Circle()
                                .fill(.white.opacity(0.3))
                        }
                        .scaleEffect(2)
                        .offset(x: -60, y: 10)
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .frame(height: 150)
                .padding()
            
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 소비내역")
                    .font(.callout)
                Text("100,000원")
                    .font(.title).bold()
            }
            .foregroundStyle(.white)
            .padding(40)
            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(.yellow)
            
        }
        
    }
    
    func rowView(_ item: Money) -> some View {
        
        HStack {
            
            VStack {
                Text(item.product)
                    .fontWeight(.bold)
                
                Text(item.category.rawValue)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Text(item.amountFormat)
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
//        .background(.yellow)
        
    }
    
    func listView() -> some View {
        
        LazyVStack {
            ForEach(money, id: \.id) { item in
                rowView(item)
            }
        }
        
        
    }
    
}

#Preview {
    MoneyView()
}
