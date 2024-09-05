//
//  PosterView.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/4/24.
//

import SwiftUI

struct PosterView: View {
    
    let url = URL(string: "https://picsum.photos/200/300")
    
    var body: some View {
        
        AsyncImage(url: url) { data in
            switch data {
            case .empty:
                ProgressView() // loading indicator
                    .frame(width: 200, height: 300)
                
                // 이미지를 가져오는 중이거나 아직 시작하지 않은 상태
            case .success(let image):
                
                NavigationLink {
                    //
                } label: {
                    VStack {
                        image
                            .resizable()
                            .frame(width: 130, height: 170)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                
                    
            case .failure:
                Image(systemName: "star")
                    .frame(width: 200, height: 300)
            }
        }
        
    }
}

#Preview {
    PosterView()
}
