//
//  TravelInfoTableViewCell.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/27/24.
//

import UIKit

class TravelInfoTableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var grade: UILabel!
    
    @IBOutlet var travel_image: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var save: UILabel!
    
    func designTravelInfo(data: Travel) {
        
        // ---- title ----
        title.text = data.title
        title.font = .boldSystemFont(ofSize: 17)
        
        // ---- description ----
        descriptionLabel.text = data.description
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.textColor = .darkGray
        descriptionLabel.numberOfLines = 2
    
        // ---- grade ----
        grade.textColor = .lightGray
        grade.font = .systemFont(ofSize: 13)
        
        // ---- save ----
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        save.text = "저장 " + numberFormatter.string(from: NSNumber(value: data.save))!
        save.textColor = .lightGray
        save.font = .systemFont(ofSize: 13)
        
        // ---- travel_image ----
        let url = URL(string: data.travel_image ?? "")
        travel_image.kf.setImage(with: url)
        travel_image.contentMode = .scaleAspectFill
        travel_image.layer.cornerRadius = 8
        
        // ---- likeButton ----
        let heart = data.like! ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: heart), for: .normal)
        likeButton.tintColor = .white
        
        
    }
    
}

