//
//  ResisterOtherTableViewCell.swift
//  Reminder Project
//
//  Created by 김성률 on 7/2/24.
//

import UIKit
import SnapKit

class RegisterOtherTableViewCell: UITableViewCell {

    let backgroundScene = UIView()
    
    let otherLabel = UILabel()
    let nextButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        
        contentView.addSubview(backgroundScene)
        backgroundScene.addSubview(otherLabel)
        backgroundScene.addSubview(nextButton)
        
    }
    
    func configureLayout() {
        
        backgroundScene.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide).inset(8)
        }
        
        otherLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backgroundScene)
            make.leading.equalTo(backgroundScene).offset(8)
        }
        
        nextButton.snp.makeConstraints { make in
            make.centerY.equalTo(backgroundScene)
            make.trailing.equalTo(backgroundScene).inset(8)
        }
        
    }
    
    func configureUI() {
        
        backgroundScene.backgroundColor = .lightGray
        backgroundScene.layer.cornerRadius = 10
        
        otherLabel.text = "마감일"
        
        nextButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        
    }
    
}

