//
//  SearchView.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/2/24.
//

import SwiftUI

struct SearchView: View {
    
    @State private var text = ""

    let list = ["Un", "Deux", "Trois", "Quatre"]
    
    var filterUser: [String] {
        return text.isEmpty ? list : list.filter { $0.contains(text) }
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(filterUser, id: \.self) { item in
                    NavigationLink {
                        SearchDetailView(data: item)
                    } label: {
                        Text("\(item)")
                    }
                }
            }
            .navigationTitle("user search")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $text, placement: .navigationBarDrawer, prompt: "figure it out")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        print("navi click")
                    }, label: {
                        Image(systemName: "person")
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "star")
                }
            }
        }
        
    }
}

#Preview {
    SearchView()
}

struct SearchDetailView: View {
    let data: String
    
    var body: some View {
        Text("SearchDetailView \(data)")
    }
    
    init(data: String) {
        self.data = data
//        print("SearchDetailView init")
    }
}
