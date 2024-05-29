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
    
    func designCityInfoTableViewCell(data: City) {
        
        cityKrEng.text = "\(data.city_name) | \(data.city_english_name)"
        cityKrEng.textColor = .white
        cityKrEng.font = .boldSystemFont(ofSize: 20)
        
        cityArray.text = data.city_explain
        cityArray.textColor = .white
        cityArray.font = .systemFont(ofSize: 14)
    
        let url = URL(string: data.city_image)
        cityImage.kf.setImage(with: url)
        cityImage.contentMode = .scaleAspectFill

        cityArrayBackground.backgroundColor = .black.withAlphaComponent(0.5)
        
    }
}
