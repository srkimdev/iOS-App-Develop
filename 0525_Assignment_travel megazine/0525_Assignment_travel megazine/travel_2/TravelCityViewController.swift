//
//  TravelCityViewController.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/27/24.
//

import UIKit
import Kingfisher

struct Travel {
    let title: String
    let description: String?
    let travel_image: String?
    let grade: Double?
    let save: Int?
    var like: Bool?
    var ad: Bool
}

class TravelCityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var travelTableView: UITableView!
    @IBOutlet var titleLabel: UILabel!
    
    var list = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        travelTableView.delegate = self
        travelTableView.dataSource = self
        
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.text = "도시 상세 정보"
        
        let xib1 = UINib(nibName: TravelInfoTableViewCell.identifier, bundle: nil)
        let xib2 = UINib(nibName: TravelAdTableViewCell.identifier, bundle: nil)
        
        travelTableView.register(xib1, forCellReuseIdentifier: TravelInfoTableViewCell.identifier)
        travelTableView.register(xib2, forCellReuseIdentifier: TravelAdTableViewCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if list[indexPath.row].ad {
            return 90
        } else {
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if list[indexPath.row].ad {
            let cell = travelTableView.dequeueReusableCell(withIdentifier: TravelAdTableViewCell.identifier, for: indexPath) as! TravelAdTableViewCell
            
            cell.designAD(data: list[indexPath.row])
            
            cell.background.backgroundColor = randomColor() // 새로 셀이 재활용될때마다 색이 바뀜 -> how?
            
            return cell
            
        } else {
            let cell = travelTableView.dequeueReusableCell(withIdentifier: TravelInfoTableViewCell.identifier, for: indexPath) as! TravelInfoTableViewCell
            
            cell.designTravelInfo(data: list[indexPath.row])
            
            let star: Int = Int(round(list[indexPath.row].grade!))
            cell.grade.text = drawStars(for: star) + " (\(list[indexPath.row].grade!))" + " · "
            
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if list[indexPath.row].ad {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "TravelADViewController") as! TravelADViewController
            
            vc.data = list[indexPath.row]
            
            let nav = UINavigationController(rootViewController: vc)
            
            nav.modalPresentationStyle = .fullScreen
            
            present(nav, animated: true)
            
        } else {
            
            let vc = storyboard?.instantiateViewController(identifier: "TravelInfoViewController") as! TravelInfoViewController
            
            vc.data = list[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
        
    @objc func likeButtonClicked(sender: UIButton) {
        
        list[sender.tag].like!.toggle()
        travelTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
        // with -> animation
    }
    
    func drawStars(for rating: Int) -> String {
        
        var starsString = ""
        for _ in 0..<rating {
            starsString += "★"
        }
        for _ in rating..<5 {
            starsString += "☆"
        }
        
        return starsString
    }

    func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        return color
    }
    
}
