//
//  RestaurantTableViewController.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/25/24.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    @IBOutlet var mainTitle: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    var restaurantlist = RestaurantList()
    var result: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 470
        
        mainTitle.text = "SeSAC 맛집 정보"
        mainTitle.textAlignment = .center
        
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .white
        searchButton.backgroundColor = .black
        
        textField.placeholder = "카테고리를 입력하세요"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0 ))
        textField.leftViewMode = .always
        
        let map = UIBarButtonItem(title: "지도", style: .plain, target: self, action: #selector(mapButtonClicked))
        navigationItem.rightBarButtonItem = map
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return restaurantlist.restaurantArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.identifier, for: indexPath) as! RestaurantTableViewCell
        
        cell.designRestaurantTableViewCell(data: restaurantlist.restaurantArray, i: indexPath.row)
        
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc func likeButtonClicked(sender: UIButton) {
        
        restaurantlist.restaurantArray[sender.tag].like.toggle()
        tableView.reloadData()
        
    }
    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        
        result = []
        
        for i in restaurantlist.restaurantArray {
            if i.category == textField.text {
                result.append([i.name, i.address, i.phoneNumber, i.image])
            }
        }
        
        UserDefaults.standard.set(result, forKey: "result")

    }
    
    @objc func mapButtonClicked() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "RestaurantLocationViewController") as! RestaurantLocationViewController
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
   
}
