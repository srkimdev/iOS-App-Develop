//
//  ProfileSettingView.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/2/24.
//

import SwiftUI

struct ProfileSettingView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        
        VStack {
            Image("profile_8")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipShape(.circle)
                .overlay(
                    Circle().stroke(Color.blue, lineWidth: 3)
                )
            
            Spacer().frame(height: 50)
            
            TextField("닉네임을 입력해주세요 :)", text: $text)
                .padding(.leading, 20)
            
        }
        .offset(y: -250)
        
    }
}

#Preview {
    ProfileSettingView()
}
