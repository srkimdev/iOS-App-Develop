//
//  otherTableViewCell.swift
//  0601_Assignment_트래블톡
//
//  Created by 김성률 on 6/1/24.
//

import UIKit

class otherTableViewCell: UITableViewCell {

    @IBOutlet var otherTextLabelUI: UIView!
    
    @IBOutlet var otherTextLabel: UILabel!
    @IBOutlet var otherUserLabel: UILabel!
    @IBOutlet var otherDateLabel: UILabel!
    
    @IBOutlet var otherImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureOtherTableViewCell(transition: ChatRoom, index: Int) {
        
        otherImage.image = UIImage(named: transition.chatList[index].user.rawValue)
        
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
    
        let temp: String = transition.chatList[index].date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        if let date = dateFormatter.date(from: temp) {
            dateFormatter.dateFormat = "HH:mm a"
            dateFormatter.locale = Locale(identifier:"ko_KR")
            
            let newDateString = dateFormatter.string(from: date)
            
            otherDateLabel.text = newDateString
        }
        
    }
    
}
