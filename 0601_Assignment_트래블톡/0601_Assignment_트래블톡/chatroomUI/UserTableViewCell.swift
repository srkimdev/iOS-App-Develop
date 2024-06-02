//
//  UserTableViewCell.swift
//  0601_Assignment_트래블톡
//
//  Created by 김성률 on 6/1/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet var otherTextLabelUI: UIView!
    
    @IBOutlet var talkLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureUserTableViewCell(transition: ChatRoom, index: Int) {
        
        talkLabel.text = transition.chatList[index].message
        talkLabel.numberOfLines = 0
        talkLabel.font = .systemFont(ofSize: 14)
        
        dateLabel.text = transition.chatList[index].date
        dateLabel.font = .systemFont(ofSize: 11)
        dateLabel.textColor = .gray
        
        otherTextLabelUI.backgroundColor = .systemGray5
        otherTextLabelUI.layer.cornerRadius = 10
        otherTextLabelUI.layer.borderWidth = 1
        otherTextLabelUI.layer.borderColor = UIColor.lightGray.cgColor
        
        let temp: String = transition.chatList[index].date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        if let date = dateFormatter.date(from: temp) {
            dateFormatter.dateFormat = "HH:mm a"
            dateFormatter.locale = Locale(identifier:"ko_KR")
            
            let newDateString = dateFormatter.string(from: date)
            
            dateLabel.text = newDateString
        }
        
    }
    
}
