//
//  MediaView.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/4/24.
//

import SwiftUI

struct SectionName: Hashable, Identifiable {
    let id = UUID()
    var section: String
}

struct MediaView: View {
    
    @State var list = [
        SectionName(section: "un"),
        SectionName(section: "deux"),
        SectionName(section: "trois"),
        SectionName(section: "quatre")
    ]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    ForEach($list, id: \.id) { item in
                        makeSectionText(text: item.section.wrappedValue)
                        makeSectionImage(text: item.section)
                    }
                }
            }
            .navigationTitle("My Random Image")
        }
        
    }
    
    func makeSectionText(text: String) -> some View {
        
        Text(text)
            .font(.title2)
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    func makeSectionImage(text: Binding<String>) -> some View {
        HorizontalSection(text: text)
    }
    
    func HorizontalSection(text: Binding<String>) -> some View {
        
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(0..<6) { _ in
                    PosterSection(text: text)
                }
            }
        }
        .padding(.horizontal, 20)
        
    }
    
    func PosterSection(text: Binding<String>) -> some View {
        
        let url = URL(string: "https://picsum.photos/id/200/300")
        
        return AsyncImage(url: url) { data in
            switch data {
            case .empty:
                ProgressView() // loading indicator
                    .frame(width: 200, height: 300)
                
                // 이미지를 가져오는 중이거나 아직 시작하지 않은 상태
            case .success(let image):
                
                NavigationLink {
                    DetailPhotoView(text: text, image: image)
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
    MediaView()
}
