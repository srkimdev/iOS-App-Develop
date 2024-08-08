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

final class TodoViewController: UIViewController {
    
    let header = UIView()
    let textField = UITextField()
    let addButton = UIButton()
    
    let todoTableView = UITableView()
    let todoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    let viewModel = TodoViewModel()
    let disposeBag = DisposeBag()
    
    static func layout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 40)
        layout.scrollDirection = .horizontal
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "TodoTableViewCell")
        todoCollectionView.register(TodoCollectionViewCell.self, forCellWithReuseIdentifier: "TodoCollectionViewCell")
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        bind()
    }
    
    func configureHierarchy() {
        view.addSubview(header)
        header.addSubview(textField)
        header.addSubview(addButton)
        view.addSubview(todoCollectionView)
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
        
        todoCollectionView.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        todoTableView.snp.makeConstraints { make in
            make.top.equalTo(todoCollectionView.snp.bottom).offset(10)
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
    
    func bind() {
        
        let tabCell = PublishSubject<todo>()
        let starButtonTap = PublishRelay<Int>()
        let checkButtonTap = PublishRelay<Int>()
        
        let input = TodoViewModel.Input(addButtonTap: addButton.rx.tap, newTodoText: textField.rx.text, starButtonTap: starButtonTap, checkButtonTap: checkButtonTap, tabCell: tabCell)
        let output = viewModel.transform(input: input)
        
        output.todoList
            .bind(to: todoCollectionView.rx.items(cellIdentifier: "TodoCollectionViewCell", cellType: TodoCollectionViewCell.self)) { (item, element, cell) in
                
                cell.label.text = element.chore
                
            }
            .disposed(by: disposeBag)
        
        output.tableList
            .bind(to: todoTableView.rx.items(cellIdentifier: "TodoTableViewCell", cellType: TodoTableViewCell.self)) { (row, element, cell) in
                cell.designCell(transition: element)
                
                cell.starButton.rx.tap
                    .bind(with: self) { owner, _ in
                        starButtonTap.accept(row)
                    }
                    .disposed(by: cell.disposeBag)
                
                cell.checkButton.rx.tap
                    .bind(with: self) { owner, _ in
                        checkButtonTap.accept(row)
                    }
                    .disposed(by: cell.disposeBag)
                
            }
            .disposed(by: disposeBag)
        
        todoCollectionView.rx.modelSelected(todo.self)
            .subscribe(with: self) { owner, value in
                tabCell.onNext(value)
            }
            .disposed(by: disposeBag)
        
    }

}


