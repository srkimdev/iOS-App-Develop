//
//  CategoryView.swift
//  SwiftUIClass
//
//  Created by 김성률 on 9/8/24.
//

import SwiftUI

struct CategoryView: View {
    
    @State private var genre = "hola"
    @State private var isOn = false
    
    var body: some View {
        
        Button {
            print("check")
        } label: {
            VStack {
                Image(systemName: "star")
                Text("Button")
            }
            .padding()
            .background(.yellow)
        }
        
        CategoryPresentView(text: genre)
//        Toggle("스위치", isOn: $isOn)
//            .background(.yellow)
        CategoryButtonView(genre: $genre)

        
    }
}

struct CategoryPresentView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title)
    }
    
}

struct CategoryButtonView: View {
    
    @Binding var genre: String
    
    var body: some View {
        HStack {
            Button("romance") {
                genre = "romance"
            }
            
            Button("action") {
                genre = "action"
            }
            
            Button("thriller") {
                genre = "thriller"
            }
        }
    }
    
}

#Preview {
    CategoryView()
}
