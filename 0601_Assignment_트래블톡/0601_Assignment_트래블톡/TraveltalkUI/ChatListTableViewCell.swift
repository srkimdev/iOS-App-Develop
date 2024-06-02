//
//  ChatroomTableViewCell.swift
//  0601_Assignment_트래블톡
//
//  Created by 김성률 on 6/1/24.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {

    static let identifier = "ChatListTableViewCell"
    
    @IBOutlet var chatRoomImage: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var chatContents: UILabel!
    @IBOutlet var latestDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureChatroomTableViewCell(transition: ChatRoom) {
        
        chatRoomImage.image = UIImage(named: transition.chatroomImage[0])
        chatRoomImage.layer.masksToBounds = true
        chatRoomImage.contentMode = .scaleAspectFit
        chatRoomImage.layer.cornerRadius = chatRoomImage.frame.width / 2
        chatRoomImage.layer.borderWidth = 1
        
        userName.text = transition.chatroomName
        userName.font = .boldSystemFont(ofSize: 15)
        
        chatContents.text = transition.chatList[transition.chatList.count - 1].message
        chatContents.font = .systemFont(ofSize: 15)
        chatContents.textColor = .gray
        
        let temp: String = transition.chatList[transition.chatList.count - 1].date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        if let date = dateFormatter.date(from: temp) {
            dateFormatter.dateFormat = "yy.MM.dd"
            
            let newDateString = dateFormatter.string(from: date)
            print(newDateString)
            
            latestDate.text = newDateString
        }
        
        latestDate.font = .systemFont(ofSize: 13)
        latestDate.textColor = .gray
        
    }
    
}
