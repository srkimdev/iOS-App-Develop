//
//  CategoryView.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/5/24.
//

import SwiftUI

struct Categories: Hashable, Identifiable {
    var id = UUID()
    let name: String
    let count: Int
}

struct CategoryView: View {
    
    @State private var text = ""
    
    let item = ["SF", "Animation", "Thriller", "Romance"]
    
    @State var list = [
        Categories(name: "SF", count: 27)
    ]
    
    var filterUser: [Categories] {
        text.isEmpty ? list : list.filter { $0.name.contains(text) }
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(list, id: \.id) { item in
                    rowView(genre: item.name, num: item.count)
                }
            }
            .navigationTitle("영화 검색")
            .searchable(text: $text, prompt: "영화를 검색해보세요.")
            .onSubmit(of: .search) {
                list = filterUser
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        list.append(Categories(name: item.randomElement()!, count: .random(in: 1...100)))
                    }, label: {
                        Text("추가")
                    })
                }
            }
        }
        
        
    }
    
    func rowView(genre: String, num: Int) -> some View {
        
        HStack {
            Image(systemName: "person")
            Text("\(genre)(\(num))")
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
        }
        
    }
}

#Preview {
    CategoryView()
}
