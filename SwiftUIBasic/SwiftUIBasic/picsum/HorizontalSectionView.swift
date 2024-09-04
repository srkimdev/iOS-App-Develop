//
//  HorizontalSectionView.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/4/24.
//

import SwiftUI

struct HorizontalSectionView: View {
    
    var body: some View {
        
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<6) { item in
                    PosterView()
                }
            }
        }
        .padding(.horizontal, 20)
        
    }
    
}

#Preview {
    HorizontalSectionView()
}
