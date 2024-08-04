//
//  TodoViewController.swift
//  0730_RxSwift
//
//  Created by 김성률 on 8/3/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

struct todo {
    var check: Bool
    let chore: String
    var star: Bool
}

final class TodoViewController: UIViewController {
    
    let list = BehaviorRelay(value: [
        todo(check: false, chore: "그립톡 구매하기", star: false),
        todo(check: false, chore: "사이다 구매", star: false),
        todo(check: false, chore: "아이패드 케이스 최저가 알아보기", star: false),
        todo(check: false, chore: "양말", star: false)
    ])
    
    let header = UIView()
    let textField = UITextField()
    let addButton = UIButton()
    
    let todoTableView = UITableView()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTableView.dataSource = self
        todoTableView.delegate = self
        todoTableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "TodoTableViewCell")
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        bind()
    }
    
    func configureHierarchy() {
        view.addSubview(header)
        header.addSubview(textField)
        header.addSubview(addButton)
        view.addSubview(todoTableView)
    }
    
    func configureLayout() {
        header.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(60)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(header.snp.top).offset(8)
            make.leading.equalTo(header.snp.leading).offset(8)
            make.bottom.equalTo(header.snp.bottom).inset(8)
            make.width.equalTo(200)
        }
        
        addButton.snp.makeConstraints { make in
            make.top.equalTo(header.snp.top).offset(14)
            make.trailing.equalTo(header.snp.trailing).inset(14)
            make.bottom.equalTo(header.snp.bottom).inset(14)
            make.width.equalTo(60)
        }
        
        todoTableView.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    
    func configureUI() {
        
        view.backgroundColor = .white
        navigationItem.title = "쇼핑"
        
        todoTableView.rowHeight = 60
        
        textField.placeholder = "무엇을 구매하실 건가요?"
        textField.leftViewMode = .always
        
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 15)
        addButton.layer.masksToBounds = true
        addButton.layer.cornerRadius = 8
        addButton.backgroundColor = .systemGray5
        
        header.backgroundColor = .systemGray6
        header.layer.cornerRadius = 7
        
    }
    
    @objc func checkButtonClicked(sender: UIButton) {
//        list.value[sender.tag].check.toggle()
//        todoTableView.reloadData()
    }
    
    @objc func starButtonClicked(sender: UIButton) {
//        list.value[sender.tag].star.toggle()
//        todoTableView.reloadData()
    }
    
    func bind() {

        list
            .bind(with: self) { owner, _ in
                owner.todoTableView.reloadData()
            }
            .disposed(by: disposeBag)
        
        addButton.rx.tap
            .bind(with: self) { owner, _ in
                var currentList = owner.list.value
                currentList.append(todo(check: false, chore: owner.textField.text ?? "", star: false))
                owner.list.accept(currentList)
            }
        
    }

}

extension TodoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath) as! TodoTableViewCell
        
        cell.designCell(transition: list.value[indexPath.row])
        
        cell.checkButton.tag = indexPath.row
        cell.starButton.tag = indexPath.row
        
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        cell.starButton.addTarget(self, action: #selector(starButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
}


