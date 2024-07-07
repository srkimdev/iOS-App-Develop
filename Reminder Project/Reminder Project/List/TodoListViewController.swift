//
//  TodoListViewController.swift
//  Reminder Project
//
//  Created by 김성률 on 7/2/24.
//

import UIKit
import SnapKit
import RealmSwift
import FSCalendar

class TodoListViewController: UIViewController, RegisterViewControllerDelegate {
    
    let totalLabel = UILabel()
    let searchBar = UISearchBar()
    
    let todoTableView = UITableView()
    
    var list: Results<DBTable>!
    let realrepository = RealmRepository()
    let realm = try! Realm()
    var standard: Int
    
    init(standard: Int) {
        self.standard = standard
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.register(TodoListTableViewCell.self, forCellReuseIdentifier: TodoListTableViewCell.identifier)
        
        searchBar.delegate = self
        
        list = realrepository.readItems(standard: standard).sorted(byKeyPath: "memoTitle", ascending: true)
    }
    
    func configureHierarchy() {
        view.addSubview(totalLabel)
        view.addSubview(searchBar)
        view.addSubview(todoTableView)
    }
    
    func configureLayout() {
        
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(24)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(totalLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(44)
        }
        
        todoTableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func configureUI() {
        
        view.backgroundColor = .white
        
        let item = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(updateButtonClicked))
        navigationItem.rightBarButtonItem = item
        
        totalLabel.text = "전체"
        totalLabel.font = .systemFont(ofSize: 28)
        totalLabel.textColor = .blue
        
        todoTableView.rowHeight = 70
        
    }
    
    func RegisterViewControllerDidDismiss() {
        
        todoTableView.reloadData()
    }
    
    @objc func circleButtonClicked(sender: UIButton) {

        try! realm.write {
            list[sender.tag].complete.toggle()
        }

        let state = list[sender.tag].complete
        
        let color: UIColor = state ? .gray : .clear
        sender.backgroundColor = color
        
        UIView.performWithoutAnimation {
            todoTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
        }
    }
    
    @objc func updateButtonClicked() {
        list = realm.objects(DBTable.self).sorted(byKeyPath: "enrollDate", ascending: false)
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
        cell.circleImage.backgroundColor = data.complete ? .gray : .clear
        cell.circleImage.tag = indexPath.row
        cell.circleImage.addTarget(self, action: #selector(circleButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제") { (_, _, completionHandler) in
            try! self.realm.write {
                self.realm.delete(self.list[indexPath.row])
            }
            
        }

        let flagAction = UIContextualAction(style: .normal, title: "깃발") { (_, _, completionHandler) in
            
            try! self.realm.write {
                self.list[indexPath.row].flag.toggle()
            }
            
        }
    
        self.todoTableView.reloadData()
        flagAction.backgroundColor = .orange
        
        return UISwipeActionsConfiguration(actions: [deleteAction, flagAction])
    }

}

extension TodoListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(#function)
        
        let filter = realm.objects(DBTable.self).where {
            $0.memoTitle.contains(searchText, options: .caseInsensitive) || $0.memoContents.contains(searchText,  options: .caseInsensitive)
        }
        
        let result = searchText.isEmpty ? realm.objects(DBTable.self) : filter
        
        list = result
        
        todoTableView.reloadData()
    }
}


