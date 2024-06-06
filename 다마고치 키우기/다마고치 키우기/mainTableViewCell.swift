//
//  mainTableViewCell.swift
//  다마고치 키우기
//
//  Created by 김성률 on 6/6/24.
//

import UIKit

class mainTableViewCell: UITableViewCell {
    
    let damagochi1 = UIButton()
    let damagochi2 = UIButton()
    let damagochi3 = UIButton()
    
    let damagochi1Label = UILabel()
    let damagochi2Label = UILabel()
    let damagochi3Label = UILabel()

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
        
        contentView.addSubview(damagochi1)
        contentView.addSubview(damagochi2)
        contentView.addSubview(damagochi3)
        
        contentView.addSubview(damagochi1Label)
        contentView.addSubview(damagochi2Label)
        contentView.addSubview(damagochi3Label)
        
    }
    
    func configureLayout() {
        
        damagochi1.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(24)
            make.leading.equalTo(contentView.snp.leading).offset(32)
            make.height.equalTo(85)
            make.width.equalTo(85)
        }
        
        damagochi3.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(24)
            make.trailing.equalTo(contentView.snp.trailing).offset(-32)
            make.height.equalTo(85)
            make.width.equalTo(85)
        }
        
        damagochi2.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(24)
            make.leading.equalTo(damagochi1.snp.trailing).offset(38)
            make.height.equalTo(85)
            make.width.equalTo(85)
        }
        
        damagochi1Label.snp.makeConstraints { make in
            make.top.equalTo(damagochi1.snp.bottom).offset(4)
            make.leading.equalTo(contentView.snp.leading).offset(28)
            make.width.equalTo(96)
            make.height.equalTo(24)
        }
        
        damagochi2Label.snp.makeConstraints { make in
            make.top.equalTo(damagochi2.snp.bottom).offset(4)
            make.leading.equalTo(damagochi1.snp.trailing).offset(32)
            make.width.equalTo(96)
            make.height.equalTo(24)
        }
        
        damagochi3Label.snp.makeConstraints { make in
            make.top.equalTo(damagochi3.snp.bottom).offset(4)
            make.trailing.equalTo(contentView.snp.trailing).offset(-28)
            make.width.equalTo(96)
            make.height.equalTo(24)
        }
        
        
        
    }
    
    func configureUI() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
    }
    
    func designDamagochiLabel(label: UILabel, name: String) {
        label.text = name
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.layer.borderWidth = 1
    }
    
    func designFirstCell(transition: [Damagochi]) {
        
        if let image = UIImage(named: transition[0].image) {
            damagochi1.setImage(image, for: .normal)
        }
        
        if let image = UIImage(named: transition[1].image) {
            damagochi2.setImage(image, for: .normal)
        }
        
        if let image = UIImage(named: transition[2].image) {
            damagochi3.setImage(image, for: .normal)
        }
        
        designDamagochiLabel(label: damagochi1Label, name: transition[0].name)
        designDamagochiLabel(label: damagochi2Label, name: transition[1].name)
        designDamagochiLabel(label: damagochi3Label, name: transition[2].name)
        
    }

}
