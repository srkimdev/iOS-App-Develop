//
//  CityInfoTableViewCell.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/29/24.
//

import UIKit

class CityInfoTableViewCell: UITableViewCell {

    static let identifier = "CityInfoTableViewCell"
    
    @IBOutlet var cityKrEng: UILabel!
    @IBOutlet var cityArray: UILabel!
    @IBOutlet var cityImage: UIImageView!
    @IBOutlet var cityArrayBackground: UIView!
    
    func designCityInfoTableViewCell(transition: City) {
        
        cityKrEng.text = "\(transition.city_name) | \(transition.city_english_name)"
        cityKrEng.textColor = .white
        cityKrEng.font = .boldSystemFont(ofSize: 20)
        
        cityArray.text = transition.city_explain
        cityArray.textColor = .white
        cityArray.font = .systemFont(ofSize: 14)
    
        let url = URL(string: transition.city_image)
        cityImage.kf.setImage(with: url)
        cityImage.contentMode = .scaleAspectFill
        cityImage.layer.cornerRadius = 15
        cityImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]

        cityArrayBackground.backgroundColor = .black.withAlphaComponent(0.5)
        cityArrayBackground.layer.cornerRadius = 15
        cityArrayBackground.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
    }
}
