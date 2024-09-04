//
//  MediaView.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/4/24.
//

import SwiftUI

struct MediaView: View {
    
    let list = [
        "un",
        "deux",
        "trois",
        "quatre"
    ]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(list, id: \.self) { item in
                        makeSection(item)
                    }
                }
            }
            .navigationTitle("My Random Image")
        }
        
    }
    
    func makeSection(_ text: String) -> some View {
        
        VStack {
            Text(text)
                .font(.title2)
                .padding(.leading, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
            HorizontalSection(text)
        }
        
    }
    
    func HorizontalSection(_ text: String) -> some View {
        
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<6) { item in
                    PosterSection(text)
                }
            }
        }
        .padding(.horizontal, 20)
        
    }
    
    func PosterSection(_ text: String) -> some View {
        
        let url = URL(string: "https://picsum.photos/200/300")
        
        return AsyncImage(url: url) { data in
            switch data {
            case .empty:
                ProgressView() // loading indicator
                    .frame(width: 200, height: 300)
                
                // 이미지를 가져오는 중이거나 아직 시작하지 않은 상태
            case .success(let image):
                
                NavigationLink {
                    DetailPhoto(text: text, image: image)
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
    
    func DetailPhoto(text: String, image: Image) -> some View {
        
        VStack {
            image
                .frame(width: 200, height: 300)
            
            Text(text)
        }
        
    }
    
}

#Preview {
    MediaView()
}
