//
//  OnBoardingView.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/2/24.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Image("launch")
                    .offset(y: -30)
                
                Image("launchImage")
                
                NavigationLink("시작하기") {
                    ProfileSettingView()
                }
                .frame(width: 300, height: 40)
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(.capsule)
                .offset(y: 80)
            }
        }
        
    }
}

#Preview {
    OnBoardingView()
}
