//
//  TagViewController.swift
//  Reminder Project
//
//  Created by 김성률 on 7/3/24.
//

import UIKit
import SnapKit

class TagViewController: UIViewController {

    let textField = UITextField()
    
    var inputText: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        inputText?(textField.text!)
    }
    
    func configureHierarchy() {
        view.addSubview(textField)
    }
    
    func configureLayout() {
        textField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(44)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .systemGray5
        textField.backgroundColor = .white
    }

}
