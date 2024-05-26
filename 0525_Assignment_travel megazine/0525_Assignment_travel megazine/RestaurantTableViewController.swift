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
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return restaurantlist.restaurantArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell
        
        // ---- image ----
        let url = URL(string: restaurantlist.restaurantArray[indexPath.section].image)
        
        cell.restaurantImage.contentMode = .scaleAspectFill
        cell.restaurantImage.kf.setImage(with: url)
        cell.restaurantImage.layer.cornerRadius = 15
        
        cell.addressImage.image = UIImage(systemName: "mappin.and.ellipse")
        cell.addressImage.tintColor = .black
        cell.addressImage.contentMode = .scaleToFill
        
        cell.callImage.image = UIImage(systemName: "phone")
        cell.callImage.tintColor = .black
        
        cell.tagImage.image = UIImage(systemName: "tag")
        cell.tagImage.tintColor = .black
        
        
        // ---- title ----
        cell.title.text = restaurantlist.restaurantArray[indexPath.section].name
        cell.title.font = .boldSystemFont(ofSize: 18)
        cell.title.numberOfLines = 1
        
        // ---- label ----
        cell.addressLabel.text = restaurantlist.restaurantArray[indexPath.section].address
        cell.addressLabel.numberOfLines = 2
        cell.callLabel.text = restaurantlist.restaurantArray[indexPath.section].phoneNumber
        cell.tagLabel.text = restaurantlist.restaurantArray[indexPath.section].category
        
        cell.addressLabel.font = .systemFont(ofSize: 15)
        cell.callLabel.font = .systemFont(ofSize: 15)
        cell.tagLabel.font = .systemFont(ofSize: 15)
        
        // ---- likeButton ----
        
        let heart = restaurantlist.restaurantArray[indexPath.section].like ? "heart.fill" : "heart"
        
        cell.likeButton.setImage(UIImage(systemName: heart), for: .normal)
        cell.likeButton.tintColor = .red
        cell.likeButton.tag = indexPath.section
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
        print(result)
        // 한식, 중식, 카페, 경양식
    }
   
}
