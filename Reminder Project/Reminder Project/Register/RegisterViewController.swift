//
//  RegisterViewController.swift
//  Reminder Project
//
//  Created by 김성률 on 7/2/24.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {

    let registerTableView = UITableView()
    
    let list = ["마감일", "태그", "우선순위", "이미지 추가"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        
        registerTableView.delegate = self
        registerTableView.dataSource = self
        registerTableView.register(RegisterFirstTableViewCell.self, forCellReuseIdentifier: RegisterFirstTableViewCell.identifier)
        registerTableView.register(RegisterOtherTableViewCell.self, forCellReuseIdentifier: RegisterOtherTableViewCell.identifier)
        
    }
    
    func configureHierarchy() {
        view.addSubview(registerTableView)
    }
    
    func configureLayout() {
        registerTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureUI() {
        
        view.backgroundColor = .white
        
        let leftBarButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonClicked))
        navigationItem.leftBarButtonItem = leftBarButton
        
        let rightBarButton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(addButtonClicked))
        navigationItem.rightBarButtonItem = rightBarButton
        
        navigationItem.title = "새로운 할일"
        
    }
    
    @objc func cancelButtonClicked() {
        dismiss(animated: true)
    }
    
    @objc func addButtonClicked() {
        
        if titleTextField.text.isEmpty {
            // alert
        }
        
        dismiss(animated: true)
    }
    
}

extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 160
        } else {
            return 65
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return list.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = registerTableView.dequeueReusableCell(withIdentifier: RegisterFirstTableViewCell.identifier, for: indexPath) as! RegisterFirstTableViewCell
            
            return cell
            
        } else {
            
            let cell = registerTableView.dequeueReusableCell(withIdentifier: RegisterOtherTableViewCell.identifier, for: indexPath) as! RegisterOtherTableViewCell
            
            return cell
        }
        
    }
    
}
