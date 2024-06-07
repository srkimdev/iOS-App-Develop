//
//  SettingTableViewCell.swift
//  다마고치 키우기
//
//  Created by 김성률 on 6/7/24.
//

import UIKit
import SnapKit

class SettingTableViewCell: UITableViewCell {

    let settingImage = UIImageView()
    let titleLabel = UILabel()
    var name = UILabel()
    let nextButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        
        contentView.addSubview(settingImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(name)
        contentView.addSubview(nextButton)
        
    }
    
    func configureLayout() {
        
        settingImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(12)
            make.leading.equalTo(contentView.snp.leading).offset(24)
            make.bottom.equalTo(contentView.snp.bottom).offset(-12)
            make.width.equalTo(26)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(12)
            make.leading.equalTo(settingImage.snp.trailing).offset(12)
            make.bottom.equalTo(contentView.snp.bottom).offset(-12)
            make.width.equalTo(150)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(12)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-12)
            make.width.equalTo(16)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(12)
            make.leading.equalTo(titleLabel.snp.trailing).offset(12)
            make.trailing.equalTo(nextButton.snp.leading).offset(-8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-12)
        }
        
        
    }
    
    func configureUI() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        settingImage.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        titleLabel.font = .boldSystemFont(ofSize: 13)
        
        nextButton.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        nextButton.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        name.font = .systemFont(ofSize: 13)
        name.textAlignment = .right
        name.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
    }
    
}
