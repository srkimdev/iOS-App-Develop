//
//  CityInfoViewController.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/29/24.
//

import UIKit

class CityInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet var cityInfoTableView: UITableView!
    @IBOutlet var citySegueControl: UISegmentedControl!
    @IBOutlet var searchBar: UISearchBar!
    
    var list = CityInfo().city
    var filteredList: [City] = []
    var store: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(0, forKey: "where")
        
        filteredList = list
        store = list
        
        cityInfoTableView.rowHeight = 150

        cityInfoTableView.delegate = self
        cityInfoTableView.dataSource = self
        searchBar.delegate = self
        
        let xib = UINib(nibName: CityInfoTableViewCell.identifier, bundle: nil)
        cityInfoTableView.register(xib, forCellReuseIdentifier: CityInfoTableViewCell.identifier)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = cityInfoTableView.dequeueReusableCell(withIdentifier: CityInfoTableViewCell.identifier, for: indexPath) as! CityInfoTableViewCell
        
        cell.designCityInfoTableViewCell(data: filteredList[indexPath.row])
        
        return cell
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

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        var ex: [City] = []
        
        guard let result = searchBar.text?.lowercased() else {
            return
        }
        
        let removeSpace = result.replacingOccurrences(of: " ", with: "")
        UserDefaults.standard.set(removeSpace, forKey: "hightlight") // how to change the color?
        
        for item in store {

            if item.city_english_name.lowercased().contains(removeSpace) || item.city_name.contains(removeSpace) || item.city_explain.contains(removeSpace) {
                ex.append(item)
            }
            
        }
        
        filteredList = ex
        
        cityInfoTableView.reloadData()
    }
    
    
    
}
