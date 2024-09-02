//
//  SimpleCountView.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/2/24.
//

import SwiftUI

struct SimpleCountView: View {
    
    @State private var number = 10
    
    var countProperty: some View {
        Text("property customView")
            .font(.largeTitle)
            .background(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
    }
    
    func functionProperty() -> some View {
        Text("function customView")
            .font(.largeTitle)
            .background(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
    }
    
    var body: some View {
        countProperty
        functionProperty()
        RenderingTestView()
    }
}

private struct RenderingTestView: View {

    init() {
        print("RenderingTestView init")
    }
    
    var body: some View {
        Text("struct customView")
            .font(.largeTitle)
            .background(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
    }
    
}

#Preview {
    SimpleCountView()
}
