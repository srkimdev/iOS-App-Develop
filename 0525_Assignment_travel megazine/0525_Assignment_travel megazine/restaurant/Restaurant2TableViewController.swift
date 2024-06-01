//
//  Restaurant2TableViewController.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/25/24.
//

import UIKit

class Restaurant2TableViewController: UITableViewController {

    @IBOutlet var resultLabel: UILabel!
    
    var result: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 120
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var temp = (UserDefaults.standard.array(forKey: "result") as? [[String]])!
        result = temp
        resultLabel.text = "총 \(result.count)개를 검색했습니다."
        resultLabel.textAlignment = .center
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Restaurant2TableViewCell.identifier, for: indexPath) as! Restaurant2TableViewCell
        let url = URL(string: result[indexPath.row][3])
        
        cell.name.text = result[indexPath.row][0]
        cell.address.text = result[indexPath.row][1]
        cell.phone.text = result[indexPath.row][2]
        cell.restaurantImage.kf.setImage(with: url)
        
        cell.configureRestaurant2TableViewCell()
        
        return cell 
    }
    
}
