//
//  TodoListViewController.swift
//  Reminder Project
//
//  Created by 김성률 on 7/2/24.
//

import UIKit
import SnapKit

class TodoListViewController: UIViewController {
    
    let totalLabel = UILabel()
    let todoTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.register(TodoListTableViewCell.self, forCellReuseIdentifier: TodoListTableViewCell.identifier)
        
    }
    
    func configureHierarchy() {
        
        view.addSubview(totalLabel)
        view.addSubview(todoTableView)
        
    }
    
    func configureLayout() {
        
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(24)
        }
        
        todoTableView.snp.makeConstraints { make in
            make.top.equalTo(totalLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func configureUI() {
        
        view.backgroundColor = .white
        
        let item = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(nextButtonClicked))
        navigationItem.leftBarButtonItem = item
        
        totalLabel.text = "전체"
        totalLabel.font = .systemFont(ofSize: 28)
        totalLabel.textColor = .blue
        
        todoTableView.rowHeight = 60
        
    }
    
    @objc func nextButtonClicked() {
        
        let vc = RegisterViewController()
        
        let nav = UINavigationController(rootViewController: vc)
        
        present(nav, animated: true, completion: nil)
    }

}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = todoTableView.dequeueReusableCell(withIdentifier: TodoListTableViewCell.identifier, for: indexPath) as! TodoListTableViewCell
        
        
        return cell
    }

}
