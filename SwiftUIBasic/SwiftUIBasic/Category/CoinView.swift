//
//  CoinView.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/5/24.
//

import SwiftUI

struct CoinView: View {
    
    @State private var market: [Market] = []
    // 랜덤으로 마켓 정보 뽑아와서 배너에 넣어보기
    // 당겨서 새로고침
    
    var body: some View {
        NavigationView {
            ScrollView {
                bannerView()
                listView()
            }
            .refreshable {
                market = market.shuffled()
            }
            .navigationTitle("My Money")
        }
        .onAppear {
            UpbitAPI.fetchAllMarket { data in
                market = data
            }
        }
//        .task {
//            do {
//                let result = try await UpbitAPI.
//                market = result
//            } catch {
//                
//            }
//        }
        // onAppear, task 차이 -> 동작은 똑같이 동작
        // onAppear는 기본적으로 동기로 동작하는 modifier -> DispatchQueue.global().async로 의도적으로 비동기로 동작하게 만들어줘야함(추가적인 래핑)
        // task는 비동기로 동작해서 따로 해줄필요 없다, 자동으로 취소 처리를 지원한다. -> 뷰가 사라지면 실행중인 작업 취소
        
    }
    
    func bannerView() -> some View {
        // 겹치는 형태
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.yellow)
               .overlay(alignment: .leading) {
                   Circle()
                       .fill(.green)
                       .overlay {
                           Circle()
                               .fill(.white.opacity(0.3))
                       }
                       .scaleEffect(2)
                       .offset(x: -60, y: 10.0)
               }
               .clipShape(RoundedRectangle(cornerRadius: 25))
               .frame(height: 150)
               .padding()
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 소비내역")
                    .font(.callout)
                Text("sdd")
                    .font(.title).bold()
            }
            .foregroundStyle(.white)
            .padding(40)
            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(.yellow)
            
        }
        
    }
    
    func listView() -> some View {
        LazyVStack {
            ForEach($market, id: \.self) { item in
                rowView(item: item)
            }
        }
    }
    
}

struct rowView: View {
    
    @Binding var item: Market
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.koreanName)
                    .fontWeight(.bold)
                Text(item.market)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(item.englishName)
            
            Button(action: {
                item.like.toggle()
            }, label: {
                Image(systemName: item.like ? "heart.fill" : "heart")
            })

        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
    
}

#Preview {
    CoinView()
}

