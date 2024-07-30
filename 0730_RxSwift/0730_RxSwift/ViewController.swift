//
//  ViewController.swift
//  0730_RxSwift
//
//  Created by 김성률 on 7/30/24.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    
    let simpleSwitch = UISwitch()
    
    let signName = UITextField()
    let signEmail = UITextField()
    let signButton = UIButton()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    func configureHierarchy() {
        
    }
    
    func configureLayout() {
        
    }
    
    func configureUI() {
        
    }

    
    
    
}

