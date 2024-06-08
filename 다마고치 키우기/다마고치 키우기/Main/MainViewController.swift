//
//  MainViewController.swift
//  다마고치 키우기
//
//  Created by 김성률 on 6/6/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    var mainCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        let mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        mainCollectionView.backgroundColor = .white
        
        mainCollectionView.register(mainCollectionViewCell.self, forCellWithReuseIdentifier: mainCollectionViewCell.identifier)

        return mainCollectionView
    }()
    
    var list = DamagochiList().damagochiArray
    
    var navigationTitle = "다마고치 선택하기"

    override func viewDidLoad() {
        super.viewDidLoad()
                
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = navigationTitle
    }
    
    func configureHierarchy() {
        
        view.addSubview(mainCollectionView)
        
    }
    
    func configureLayout() {
        
        mainCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-12)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func configureUI() {
        
        view.backgroundColor = #colorLiteral(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        mainCollectionView.backgroundColor = .clear
        
        navigationController?.navigationBar.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)]   
    }
    
    @objc func imageButtonClicked(sender: UIButton) {
        
        let vc = popupScreenViewController(data: list[sender.tag])
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve

        vc.startButtonTitle = "변경하기"

        present(vc, animated: true)
        
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: mainCollectionViewCell.identifier, for: indexPath) as! mainCollectionViewCell
        
        cell.damagochiButton.tag = indexPath.row
        cell.damagochiButton.addTarget(self, action: #selector(imageButtonClicked), for: .touchUpInside)
        
        cell.configureCollectionViewCell(transition: list[indexPath.row])
        
        return cell

    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 10
        let collectionViewWidth = collectionView.frame.width
        let cellWidth = (collectionViewWidth - 2 * padding) / 3
        
        return CGSize(width: cellWidth, height: 130)
    }
    
}
