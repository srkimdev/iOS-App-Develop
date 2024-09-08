//
//  RenderingView.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/7/24.
//

import SwiftUI

struct RenderingView: View {
    
    @State var number = 10
    
    var body: some View {
        Text("Jack")
            .font(.largeTitle)
        den
        bran()
        Hue()
        
        Button("check \(number)") {
            number += 1
        }
        
    }
    
    var den: some View {
        Text("Den")
            .background(randomColor())
            .font(.largeTitle)
    }
    
    func bran() -> some View {
        Text("Bran")
            .background(randomColor())
            .font(.largeTitle)
    }
    
    init() {
        print("RenderingView init")
    }
    
    private func randomColor() -> Color {
        return Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
    
}

private struct Hue: View {
    
    var body: some View {
        Text("Hue")
            .font(.largeTitle)
            .background(randomColor())
    }
    
    init() {
        print("Hue init")
    }
    
    private func randomColor() -> Color {
        return Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
    
}
  
#Preview {
    RenderingView()
}
