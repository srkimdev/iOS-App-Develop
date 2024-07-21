//
//  ChattingData.swift
//  0719_DiffableDataSource+ListConfiguration
//
//  Created by 김성률 on 7/21/24.
//

import Foundation

struct ChatRoom: Hashable {
    let chatroomId: Int
    let chatroomImage: String
    let chatroomName: String
    let chatroomText: String
}

//채팅 화면에서 사용할 데이터 구조체

let mockChatList: [ChatRoom] = [
    ChatRoom(chatroomId: 1,
             chatroomImage: "Hue",
             chatroomName: "영등포 멘토방",
             chatroomText: "열심히 일 하시고 계시는거죠?"
            ),
    ChatRoom(chatroomId: 2,
             chatroomImage: "Hue",
             chatroomName: "hue",
             chatroomText: "열심히 공부하고 계시는거죠?"
            ),
    ChatRoom(chatroomId: 3,
             chatroomImage: "Jack",
             chatroomName: "jack",
             chatroomText: "성률님~ 오늘 깃허브를 보니 커밋을 안해주셨더라구요~~~\n깃허브 푸쉬 부탁드릴게요~~~\n설마 과제를 안하신건 아니시겠죠~~?!"
            ),
    ChatRoom(chatroomId: 4,
             chatroomImage: "Bran",
             chatroomName: "bran",
             chatroomText: "저번 과제 잘 봤습니다!!\n저번 과제에서 이러쿵 저러쿵 부분을 개선해볼 수 있을 것 같은데,\n그 부분까지 개선하셔서 다시 푸쉬해주실 수 있으시겠죠?\n설마 못한다고는 하지 않으시겠죠?"
            ),
    ChatRoom(chatroomId: 5,
             chatroomImage: "Den",
             chatroomName: "den",
             chatroomText: "성률님 잔디가 숭숭 빠지셔서 황무지 되시겠어요~ 푸쉬 기다리고 있을게요~"
             ),
    ChatRoom(chatroomId: 6,
             chatroomImage: "심심이",
             chatroomName: "simsim",
             chatroomText: "심심아 나 주말에도 개발해..."
            )
]
