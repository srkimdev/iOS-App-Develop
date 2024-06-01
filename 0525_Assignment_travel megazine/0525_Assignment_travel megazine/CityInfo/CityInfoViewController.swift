//
//  CityInfoViewController.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/29/24.
//

import UIKit

class CityInfoViewController: UIViewController {

    @IBOutlet var cityInfoTableView: UITableView!
    @IBOutlet var citySegueControl: UISegmentedControl!
    @IBOutlet var searchBar: UISearchBar!
    
    var list = CityInfo().city
    var filteredList: [City] = []
    var store: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredList = list
        store = list

        cityInfoTableView.delegate = self
        cityInfoTableView.dataSource = self
        searchBar.delegate = self
        
        configureCityInfoViewController()
        
    }
    
    @IBAction func segueButtonClicked(_ sender: UISegmentedControl) {
        
        var ex: [City] = []
        
        if sender.selectedSegmentIndex == 1 {
            
            for item in list {
                if item.domestic_travel {
                    ex.append(item)
                }
            }
            
            filteredList = ex
            
        } else if sender.selectedSegmentIndex == 2 {
            
            for item in list {
                if item.domestic_travel == false {
                    ex.append(item)
                }
            }
           
            filteredList = ex
            
        } else {
            
            filteredList = list
            
        }
        
        store = filteredList
        
        cityInfoTableView.reloadData()
        
    }
    
}

extension CityInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = cityInfoTableView.dequeueReusableCell(withIdentifier: CityInfoTableViewCell.identifier, for: indexPath) as! CityInfoTableViewCell
        
        cell.designCityInfoTableViewCell(transition: filteredList[indexPath.row])
        
        return cell
    }
    
}

extension CityInfoViewController {
    
    func configureCityInfoViewController() {
        
        cityInfoTableView.rowHeight = 150
        
        let xib = UINib(nibName: CityInfoTableViewCell.identifier, bundle: nil)
        cityInfoTableView.register(xib, forCellReuseIdentifier: CityInfoTableViewCell.identifier)
        
    }
    
}

extension CityInfoViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        var ex: [City] = []
        
        guard let result = searchBar.text?.lowercased() else {
            return
        }
        
        let removeSpace = result.replacingOccurrences(of: " ", with: "")
        
        for item in store {

            if item.city_english_name.lowercased().contains(removeSpace) || item.city_name.contains(removeSpace) || item.city_explain.contains(removeSpace) {
                ex.append(item)
            }
            
        }
        
        filteredList = ex
        
        cityInfoTableView.reloadData()
    }
    
}
