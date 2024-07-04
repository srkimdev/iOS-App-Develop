//
//  MainViewController.swift
//  Reminder Project
//
//  Created by 김성률 on 7/3/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let totalLabel = UILabel()
    let newTodo = UIButton()
    let addList = UIButton()
    
    lazy var mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    func layout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 51) / 2, height: 80)
        
        return layout
    }
    
    var list = ["오늘", "예정", "전체", "깃발 표시", "완료됨"]

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        
    }
    
    func configureHierarchy() {
        view.addSubview(totalLabel)
        view.addSubview(mainCollectionView)
        view.addSubview(newTodo)
        view.addSubview(addList)
    }
    
    func configureLayout() {
        
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(24)
        }
        
        mainCollectionView.snp.makeConstraints { make in
            make.top.equalTo(totalLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        newTodo.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(24)
            make.width.equalTo(150)
        }
        
        addList.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(24)
            make.width.equalTo(100)
        }
        
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        totalLabel.text = "전체"
        totalLabel.font = .systemFont(ofSize: 28)
        totalLabel.textColor = .blue
        
        newTodo.setImage(UIImage(systemName: "plus"), for: .normal)
        newTodo.setTitle("새로운 할 일", for: .normal)
        newTodo.setTitleColor(.black, for: .normal)
        
        addList.setTitle("목록 추가", for: .normal)
        addList.setTitleColor(.black, for: .normal)
    }
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        
        cell.designCell(transition: list[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = TodoListViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
