//
//  ProfileSettingView.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/2/24.
//

import SwiftUI

struct ProfileSettingView: View {
    
    @State private var text: String = ""
    @State private var isFull = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                Image("profile_8")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
                    .overlay(
                        Circle().stroke(Color.blue, lineWidth: 3)
                    )
                
                Spacer().frame(height: 50)
                
                TextField("닉네임을 입력해주세요 :)", text: $text)
                    .padding(.leading, 20)
                
                Spacer().frame(height: 60)
                
                HStack {
                    Text("MBTI")
                        .font(.title)
                        .bold()
                    .padding()
                    .offset(y: -30)
                    
                    Spacer()
                    
                    MBTIView()
                    
                }
                
                Spacer().frame(height: 300)
                
                Button("완료") {
                    isFull.toggle()
                }
                .frame(width: 300, height: 40)
                .foregroundStyle(.white)
                .background(.cyan)
                .clipShape(.capsule)
                
            }
            .fullScreenCover(isPresented: $isFull, content: {
                JoinCheckView()
            })
            .navigationTitle("Profile Setting")
            .navigationBarTitleDisplayMode(.inline)

        }
        
    }
}

#Preview {
    ProfileSettingView()
}

private struct MBTIView: View {
    
    let list = [["E", "S", "T", "J"], ["I", "N", "F", "P"]]
    
    var body: some View {
    
        VStack {
            ForEach(list.indices, id: \.self) { row in
                HStack {
                    ForEach(list[row].indices, id: \.self) { column in
                        Button(action: {
                                                    
                        }) {
                            Circle()
                                .fill(.clear)
                                .overlay(
                                    Circle().stroke(Color.black, lineWidth: 1)
                                )
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Text(list[row][column])
                                        .foregroundStyle(.black)
                                )
                            
                        }
                        .frame(height: 50)
                        
                    }
                }
            }
        }
        .padding(.trailing, 20)
    }
}
