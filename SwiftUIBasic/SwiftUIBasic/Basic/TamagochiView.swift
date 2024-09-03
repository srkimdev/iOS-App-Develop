//
//  TamagochiView.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/3/24.
//

import SwiftUI

struct TamagochiView: View {
    
    @State private var rice = 0
    @State private var text = ""
    
    var body: some View {
        Text("밥알 \(rice)개")
        
        HStack {
            TextField("밥주세용", text: $text)
            Button("밥먹기") {
                if let rice = Int(text) {
                    self.rice += rice
                } else {
                    rice += 1
                }
            }
        }
        
    }
}

#Preview {
    TamagochiView()
}
