//
//  mainCollectionViewCell.swift
//  다마고치 키우기
//
//  Created by 김성률 on 6/6/24.
//

import UIKit
import SnapKit

class mainCollectionViewCell: UICollectionViewCell {
    
    let damagochiButton = UIButton()
    let damagochiName = UILabel()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        
        contentView.addSubview(damagochiButton)
        contentView.addSubview(damagochiName)
        
    }
    
    func configureLayout() {
        
        damagochiButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.centerX.equalTo(self.contentView)
            make.height.equalTo(90)
            make.width.equalTo(90)
        }
        
        damagochiName.snp.makeConstraints { make in
            make.top.equalTo(damagochiButton.snp.bottom).offset(4)
            make.centerX.equalTo(self.contentView)
            make.height.equalTo(24)
            make.width.equalTo(96)
        }
        
    }
    
    func configureUI() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
    }
    
    func configureCollectionViewCell(transition: Damagochi) {
        
        let image = UIImage(named: transition.image)
        damagochiButton.setImage(image, for: .normal)
        
        damagochiName.text = transition.name
        damagochiName.font = .systemFont(ofSize: 12)
        damagochiName.textColor = DamagochiColor.greenColor
        damagochiName.textAlignment = .center
        damagochiName.layer.borderWidth = 1
        damagochiName.layer.borderColor = DamagochiColor.greenColor.cgColor
        damagochiName.layer.masksToBounds = true
        damagochiName.layer.cornerRadius = 5
    
    }
    
}
