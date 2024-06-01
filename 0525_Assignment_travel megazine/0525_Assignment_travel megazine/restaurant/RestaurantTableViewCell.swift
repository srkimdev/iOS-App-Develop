//
//  RestaurantTableViewCell.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/25/24.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    static let identifier = "RestaurantTableViewCell"
    
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var restaurantImage: UIImageView!
    @IBOutlet var addressImage: UIImageView!
    @IBOutlet var callImage: UIImageView!
    @IBOutlet var tagImage: UIImageView!
    
    @IBOutlet var title: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var callLabel: UILabel!
    @IBOutlet var tagLabel: UILabel!
    
    func configureRestaurantTableViewCell(transition: [Restaurant], i: Int) {
        
        let url = URL(string: transition[i].image)
        
        restaurantImage.contentMode = .scaleAspectFill
        restaurantImage.kf.setImage(with: url)
        restaurantImage.layer.cornerRadius = 15
        
        addressImage.image = UIImage(systemName: "mappin.and.ellipse")
        addressImage.tintColor = .black
        addressImage.contentMode = .scaleToFill
        
        callImage.image = UIImage(systemName: "phone")
        callImage.tintColor = .black
        
        tagImage.image = UIImage(systemName: "tag")
        tagImage.tintColor = .black
        
        title.text = transition[i].name
        title.font = .boldSystemFont(ofSize: 18)
        title.numberOfLines = 1
        
        addressLabel.text = transition[i].address
        addressLabel.numberOfLines = 2
        callLabel.text = transition[i].phoneNumber
        tagLabel.text = transition[i].category
        
        addressLabel.font = .systemFont(ofSize: 15)
        callLabel.font = .systemFont(ofSize: 15)
        tagLabel.font = .systemFont(ofSize: 15)
        
        let heart = transition[i].like ? "heart.fill" : "heart"
        
        likeButton.setImage(UIImage(systemName: heart), for: .normal)
        likeButton.tintColor = .red
        likeButton.tag = i
        
    }
    
    
}




