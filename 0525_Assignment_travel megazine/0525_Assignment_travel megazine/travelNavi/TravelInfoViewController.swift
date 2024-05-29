//
//  TravelInfoViewController.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/29/24.
//

import UIKit

class TravelInfoViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "관광지 화면"

        mainLabel.text = "관광지 화면"
        mainLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        mainLabel.textAlignment = .center
        
        
    }
    

}
