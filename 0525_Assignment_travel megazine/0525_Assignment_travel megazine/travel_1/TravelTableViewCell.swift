//
//  TravelTableViewCell.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/24/24.
//

import UIKit

class TravelTableViewCell: UITableViewCell {

    static let identifier = "TravelTableViewCell"
    
    @IBOutlet var travelImage: UIImageView!
    
    @IBOutlet var title: UILabel!
    
    @IBOutlet var subTitle: UILabel!
    
    @IBOutlet var date: UILabel!
    
    
    func designTravelTableView(data: Magazine) {
        
        title.text = data.title
        title.font = .boldSystemFont(ofSize: 22)
        title.numberOfLines = 2
        
        subTitle.text = data.subtitle
        subTitle.font = .systemFont(ofSize: 13)
        subTitle.textColor = .darkGray
        
        let url = URL(string: data.photo_image)
        travelImage.contentMode = .scaleAspectFill
        travelImage.layer.cornerRadius = 15
        travelImage.kf.setImage(with: url)
        
        // ---- format ----
        let format = DateFormatter()
        format.dateFormat = "yyMMdd"
        let convertDate = format.date(from: data.date)
        let time = DateFormatter()
        time.dateFormat = "yy년 MM월 dd일"
        date.text = time.string(from: convertDate!)
        date.textColor = .darkGray
        date.font = .systemFont(ofSize: 13)
    }
}
