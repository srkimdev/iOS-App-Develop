//
//  TravelAdTableViewCell.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/27/24.
//

import UIKit

class TravelAdTableViewCell: UITableViewCell {

    @IBOutlet var adTitle: UILabel!
    @IBOutlet var adLabel: UILabel!
    @IBOutlet var background: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print(#function)
        
    }
    
    func designAD(data: Travel) {
        adTitle.text = data.title
        adTitle.font = .boldSystemFont(ofSize: 15)
        
        background.layer.cornerRadius = 10
        adLabel.text = "AD"
        adLabel.layer.masksToBounds = true
        adLabel.layer.cornerRadius = 5
        adLabel.backgroundColor = .white
        adLabel.textAlignment = .center
        
    }
    
}
