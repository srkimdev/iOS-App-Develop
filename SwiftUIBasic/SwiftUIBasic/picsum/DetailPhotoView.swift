//
//  DetailPhotoView.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/4/24.
//

import SwiftUI

struct DetailPhotoView: View {
    
    @Binding var text: String
    var image: Image
    
    var body: some View {
        
        VStack {
            image
                .frame(width: 200, height: 300)
            
            TextField("input", text: $text)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle()) // 스타일 적용
                .padding(.horizontal, 20)
        }
        
    }
}
