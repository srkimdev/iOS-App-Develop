//
//  otherTableViewCell.swift
//  0601_Assignment_트래블톡
//
//  Created by 김성률 on 6/1/24.
//

import UIKit

class otherTableViewCell: UITableViewCell {

    static let identifier = "otherTableViewCell"
    
    @IBOutlet var otherTextLabelUI: UIView!
    
    @IBOutlet var otherTextLabel: UILabel!
    @IBOutlet var otherUserLabel: UILabel!
    @IBOutlet var otherDateLabel: UILabel!
    
    @IBOutlet var otherImage: UIImageView!

    func configureOtherTableViewCell(transition: ChatRoom, index: Int) {
        
        otherImage.image = UIImage(named: transition.chatList[index].user.rawValue)
        otherImage.layer.borderWidth = 1
        otherImage.layer.cornerRadius = otherImage.frame.width / 2
        otherImage.contentMode = .scaleAspectFit
        
        otherTextLabelUI.layer.borderWidth = 1
        otherTextLabelUI.layer.borderColor = UIColor.lightGray.cgColor
        otherTextLabelUI.layer.cornerRadius = 10
        
        otherTextLabel.text = transition.chatList[index].message
        otherTextLabel.numberOfLines = 0
        otherTextLabel.font = .systemFont(ofSize: 14)
        
        otherUserLabel.text = transition.chatList[index].user.rawValue
        otherUserLabel.font = .systemFont(ofSize: 13)
        
        otherDateLabel.font = .systemFont(ofSize: 11)
        otherDateLabel.textColor = .gray
        otherDateLabel.text = dateSetting(date: transition.chatList[index].date)

    }
    
}
