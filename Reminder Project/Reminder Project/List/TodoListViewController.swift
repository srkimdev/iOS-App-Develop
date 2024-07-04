//
//  TodoListViewController.swift
//  Reminder Project
//
//  Created by 김성률 on 7/2/24.
//

import UIKit
import SnapKit
import RealmSwift

class TodoListViewController: UIViewController, RegisterViewControllerDelegate {
    
    let totalLabel = UILabel()
    let todoTableView = UITableView()
    
    var list: Results<Table>!
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.register(TodoListTableViewCell.self, forCellReuseIdentifier: TodoListTableViewCell.identifier)
        
        print(realm.configuration.fileURL)
        list = realm.objects(Table.self).sorted(byKeyPath: "memoTitle")
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
        
        totalLabel.text = "전체"
        totalLabel.font = .systemFont(ofSize: 28)
        totalLabel.textColor = .blue
        
        todoTableView.rowHeight = 70
        
    }
    
    func RegisterViewControllerDidDismiss() {
        
        todoTableView.reloadData()
    }

}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = todoTableView.dequeueReusableCell(withIdentifier: TodoListTableViewCell.identifier, for: indexPath) as! TodoListTableViewCell
        
        let data = list[indexPath.row]
        
        cell.designCell(transition: data)
        
        return cell
    }

}
