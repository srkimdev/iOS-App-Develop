//
//  CustomViewModifier.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/2/24.
//

import SwiftUI

struct PointBorderText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding(10)
            .foregroundStyle(.white)
            .background(.purple)
            .clipShape(.capsule)
    }
    
}

struct CustomViewModifier: View {
    var body: some View {
        Text("Hi There")
            .modifier(PointBorderText())
//            .asPointBorderText()
    }
}

extension View {
    func asPointBorderText() -> some View {
        modifier(PointBorderText())
    }
}

#Preview {
    CustomViewModifier()
}
