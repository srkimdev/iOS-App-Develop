//
//  TravelTableViewController.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/24/24.
//

import UIKit
import Kingfisher

struct Magazine {
    
    let title: String
    let subtitle: String
    let photo_image: String
    let date: String
    let link: String
}

class TravelTableViewController: UITableViewController {

    let magazineinfo = MagazineInfo()
    var index: Int = 0
    
    @IBOutlet var titleBar: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 460
        
        titleBar.text = "SeSAC TRAVEL"
        titleBar.font = .systemFont(ofSize: 20, weight: .bold)
        titleBar.textAlignment = .center
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return magazineinfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
        
        let format = DateFormatter()
        format.dateFormat = "yyMMdd"
        let convertDate = format.date(from: magazineinfo.magazine[index].date)
        let time = DateFormatter()
        time.dateFormat = "yy년 MM월 dd일"
        cell.date.text = time.string(from: convertDate!)
        cell.date.textColor = .darkGray
        cell.date.font = .systemFont(ofSize: 13)
        
        cell.title.font = .boldSystemFont(ofSize: 22)
        cell.title.numberOfLines = 2
        cell.subTitle.font = .systemFont(ofSize: 13)
        cell.subTitle.textColor = .darkGray
        cell.travelImage.contentMode = .scaleAspectFill
        cell.travelImage.layer.cornerRadius = 15
        
        let url = URL(string: magazineinfo.magazine[index].photo_image)
        
        cell.title.text = magazineinfo.magazine[index].title
        cell.subTitle.text = magazineinfo.magazine[index].subtitle
        cell.travelImage.kf.setImage(with: url)
        
        index += 1
        
        return cell
    }
   
}
