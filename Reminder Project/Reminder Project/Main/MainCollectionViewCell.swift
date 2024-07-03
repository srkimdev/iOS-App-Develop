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
    
    func configureHierarchy() {
        contentView.addSubview(backgroundScene)
        backgroundScene.addSubview(imageShow)
        backgroundScene.addSubview(describeLabel)
        backgroundScene.addSubview(numberLabel)
    }
    
    func configureLayout() {
        backgroundScene.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
        
        imageShow.snp.makeConstraints { make in
            make.top.equalTo(backgroundScene.snp.top).offset(8)
            make.leading.equalTo(backgroundScene.snp.leading).offset(8)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        describeLabel.snp.makeConstraints { make in
            make.top.equalTo(imageShow.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(backgroundScene).inset(8)
        }
        
        numberLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundScene.snp.top).offset(8)
            make.trailing.equalTo(backgroundScene.snp.trailing).inset(8)
        }
        
        
    }
    
    func configureUI() {
        
        imageShow.image = UIImage(systemName: "star")
        
        describeLabel.text = "오늘"
        
        numberLabel.text = "0"
        
    }
    
    
}
