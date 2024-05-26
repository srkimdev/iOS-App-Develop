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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Restaurant2TableViewCell", for: indexPath) as! Restaurant2TableViewCell
        let url = URL(string: result[indexPath.row][3])
        
        cell.name.text = result[indexPath.row][0]
        cell.address.text = result[indexPath.row][1]
        cell.phone.text = result[indexPath.row][2]
        cell.restaurantImage.kf.setImage(with: url)
        cell.restaurantImage.contentMode = .scaleAspectFill
        cell.address.font = .systemFont(ofSize: 12)
        cell.phone.font = .systemFont(ofSize: 12)
        
        return cell 
    }
    // 카페 중식 한식 경양식
}
