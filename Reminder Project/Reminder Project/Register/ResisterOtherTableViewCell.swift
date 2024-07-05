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
    
    let dateLabel = UILabel()
    
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
        backgroundScene.addSubview(dateLabel)
        
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
            make.width.equalTo(20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backgroundScene)
            make.trailing.equalTo(nextButton.snp.leading)
        }
        
    }
    
    func configureUI() {
        
        contentView.backgroundColor = .systemGray5
        
        backgroundScene.layer.cornerRadius = 10
        backgroundScene.backgroundColor = .white
                
        nextButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        nextButton.tintColor = .black
        
        dateLabel.font = .systemFont(ofSize: 15)
        
    }
    
    func designCell(transition1: String, transition2: String) {
        otherLabel.text = transition1
        dateLabel.text = transition2
    }
    
}

