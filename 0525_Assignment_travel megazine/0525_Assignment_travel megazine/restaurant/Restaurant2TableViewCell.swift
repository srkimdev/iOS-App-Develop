//
//  Restaurant2TableViewCell.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/25/24.
//

import UIKit

class Restaurant2TableViewCell: UITableViewCell {

    static let identifier = "Restaurant2TableViewCell"
    
    @IBOutlet var name: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var phone: UILabel!
    
    @IBOutlet var restaurantImage: UIImageView!
    
    func configureRestaurant2TableViewCell() {
        restaurantImage.contentMode = .scaleAspectFill
        address.font = .systemFont(ofSize: 12)
        phone.font = .systemFont(ofSize: 12)
    }
    
}
