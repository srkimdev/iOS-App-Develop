//
//  TravelADViewController.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 5/29/24.
//

import UIKit

class TravelADViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    
    var data: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "광고 화면"

        mainLabel.text = data?.title
        mainLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 0
        
    }
    
    @IBAction func exitButton(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true)
        
    }
    
}
