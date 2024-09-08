//
//  AboutModifier.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/2/24.
//

import SwiftUI

struct AboutModifier: View {
    var body: some View {
        Text("Bonjour")
            .padding(10)
            .border(.black, width: 3)
        
        Button("click here") {
            let value = type(of: self.body)
//            print(value)
        }
        .padding()
        .foregroundStyle(.yellow)
        .background(.green)
    }
}

#Preview {
    AboutModifier()
}

struct User {
    
    var nickname = "고래밥"
    
    var introduce: String {
        mutating get {
            nickname = "칙촉"
            return "Hi i'm \(nickname)"
        }
    }
    // 구조체 연산 프로퍼티의 getter의 기본 속성이 nonmutating이다.
    
    mutating func changeNickname() {
        nickname = "snack"
    }
    
}
