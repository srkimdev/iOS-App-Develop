//
//  MainTableViewController.swift
//  0524_Assignment_쇼핑 테이블뷰
//
//  Created by 김성률 on 5/24/24.
//

import UIKit

struct todo {
    var check: Bool
    let chore: String
    var star: Bool
}

class MainTableViewController: UITableViewController {
    
    var list = [
        todo(check: false, chore: "그립톡 구매하기", star: false),
        todo(check: false, chore: "사이다 구매", star: false),
        todo(check: false, chore: "아이패드 케이스 최저가 알아보기", star: false),
        todo(check: false, chore: "양말", star: false)
    ]
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var header: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMain()
        
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath) as! TodoTableViewCell
        
        cell.configureTodoCell(transition: list[indexPath.row])
        
        cell.checkButton.tag = indexPath.row
        cell.starButton.tag = indexPath.row
        
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        cell.starButton.addTarget(self, action: #selector(starButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    
    @objc func checkButtonClicked(sender: UIButton) {
        list[sender.tag].check.toggle()
        tableView.reloadData()
    }
    
    @objc func starButtonClicked(sender: UIButton) {
        list[sender.tag].star.toggle()
        tableView.reloadData()
    }
    
    @objc func addButtonClicked(sender: UIButton) {
        let text = textField.text!
        list.append(todo(check: false, chore: text, star: false))
        tableView.reloadData()
    }

}

extension MainTableViewController {
    
    func configureMain() {
        
        tableView.rowHeight = 60
        textField.placeholder = "무엇을 구매하실 건가요?"
        textField.leftViewMode = .always
        
        addButton.setTitle("추가", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 8)
        addButton.layer.masksToBounds = true
        addButton.layer.cornerRadius = 8
        addButton.backgroundColor = .systemGray5
        
        header.backgroundColor = .systemGray6
        header.layer.cornerRadius = 7
    }
    
}
