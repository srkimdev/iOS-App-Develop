//
//  CategoryView.swift
//  SwiftUIClass
//
//  Created by 김성률 on 9/8/24.
//

import SwiftUI

struct CategoryView: View {
    
    init() {
        print("CategoryView init")
    }
    
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
    
    init(text: String) {
        self.text = text
        print("CategoryPresentView init")
    }
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title)
    }
    
}

struct CategoryButtonView: View {
    
    @Binding var genre: String
    
    init(genre: Binding<String>) {
//        self.genre = genre
        print("CategoryButtonView init")
        self._genre = genre
    }
    
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
