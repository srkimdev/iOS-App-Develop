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
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier, for: indexPath) as! TravelTableViewCell
        
        let data = magazineinfo.magazine[indexPath.section]
        cell.designTravelTableView(data: data)
        
        return cell
    }
   
}
