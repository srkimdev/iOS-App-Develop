//
//  TravelADViewController.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/29/24.
//

import UIKit

class TravelADViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "광고 화면"

        mainLabel.text = "광고 화면"
        mainLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        mainLabel.textAlignment = .center
        
    }
    
    @IBAction func exitButton(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true)
        
    }
    
}
