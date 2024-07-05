//
//  MainCollectionViewCell.swift
//  Reminder Project
//
//  Created by 김성률 on 7/3/24.
//

import UIKit
import SnapKit

class MainCollectionViewCell: UICollectionViewCell {
    
    let backgroundScene = UIView()
    let imageBackground = UIView()
    let imageShow = UIImageView()
    let describeLabel = UILabel()
    let numberLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        imageBackground.layer.cornerRadius = imageBackground.frame.width / 2
    }
    
    func configureHierarchy() {
        contentView.addSubview(backgroundScene)
        backgroundScene.addSubview(imageBackground)
        imageBackground.addSubview(imageShow)
        backgroundScene.addSubview(describeLabel)
        backgroundScene.addSubview(numberLabel)
    }
    
    func configureLayout() {
        backgroundScene.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
        
        imageBackground.snp.makeConstraints { make in
            make.top.equalTo(backgroundScene.snp.top).offset(8)
            make.leading.equalTo(backgroundScene.snp.leading).offset(8)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        imageShow.snp.makeConstraints { make in
            make.edges.equalTo(imageBackground).inset(4)
        }
        
        describeLabel.snp.makeConstraints { make in
            make.top.equalTo(imageBackground.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(backgroundScene).inset(8)
        }
        
        numberLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundScene.snp.top).offset(8)
            make.trailing.equalTo(backgroundScene.snp.trailing).inset(12)
        }
        
        
    }
    
    func configureUI() {
        
        backgroundScene.backgroundColor = .lightGray
        backgroundScene.layer.cornerRadius = 10
        
        imageShow.tintColor = .white
        
        numberLabel.text = "0"
        numberLabel.font = .systemFont(ofSize: 25)
        
        describeLabel.font = .systemFont(ofSize: 15)
        
    }
    
    func designCell(transition: Icon) {
        
        describeLabel.text = transition.rawValue
        imageShow.image = transition.systemImageName
        imageBackground.backgroundColor = transition.iconColor
        
    }
    
    
}
