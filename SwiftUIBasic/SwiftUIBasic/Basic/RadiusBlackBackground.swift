//
//  RadiusBlackBackground.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/7/24.
//

import SwiftUI

private struct RadiusBlackBackground: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.black)
            .clipShape(.capsule)
    }
    
}

extension View {
    
    func asRadiusBlackBackground() -> some View {
        modifier(RadiusBlackBackground())
    }
    
}

