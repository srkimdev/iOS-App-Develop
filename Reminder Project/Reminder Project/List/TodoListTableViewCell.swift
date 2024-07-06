//
//  TodoListTableViewCell.swift
//  Reminder Project
//
//  Created by 김성률 on 7/2/24.
//

import UIKit
import SnapKit

class TodoListTableViewCell: UITableViewCell {
    
    let circleImage = UIButton()
    let emphasizeLabel = UILabel()
    let titleLabel = UILabel()
    let memoLabel = UILabel()
    let deadlineLabel = UILabel()
    let tagLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        circleImage.layer.cornerRadius = circleImage.frame.width / 2
    }
    
    func configureHierarchy() {
        
        contentView.addSubview(circleImage)
        contentView.addSubview(emphasizeLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(memoLabel)
        contentView.addSubview(deadlineLabel)
        contentView.addSubview(tagLabel)
        
    }
    
    func configureLayout() {
        
        circleImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(8)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(4)
            make.height.width.equalTo(16)
        }
        
        emphasizeLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(8)
            make.leading.equalTo(circleImage.snp.trailing).offset(16)
            make.height.equalTo(14)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(8)
            make.leading.equalTo(emphasizeLabel.snp.trailing)
            make.height.equalTo(14)
        }
        
        memoLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(circleImage.snp.trailing).offset(16)
            make.height.equalTo(12)
        }
        
        deadlineLabel.snp.makeConstraints { make in
            make.top.equalTo(memoLabel.snp.bottom).offset(4)
            make.leading.equalTo(circleImage.snp.trailing).offset(16)
            make.height.equalTo(12)
        }
        
        tagLabel.snp.makeConstraints { make in
            make.top.equalTo(memoLabel.snp.bottom).offset(4)
            make.leading.equalTo(deadlineLabel.snp.trailing)
            make.height.equalTo(12)
        }
        
    }
    
    func configureUI() {
        
        circleImage.layer.borderWidth = 1
       
        emphasizeLabel.textColor = .blue
        
        titleLabel.textColor = .gray
        titleLabel.font = .systemFont(ofSize: 14)

        memoLabel.textColor = .gray
        memoLabel.font = .systemFont(ofSize: 13)
        
        deadlineLabel.textColor = .gray
        deadlineLabel.font = .systemFont(ofSize: 13)
        
        tagLabel.textColor = .systemMint
        tagLabel.font = .systemFont(ofSize: 13)
        
    }
    
    func designCell(transition: DBTable) {
        
        if transition.priority == "높음" {
            emphasizeLabel.text = "!!!"
        } else if transition.priority == "보통" {
            emphasizeLabel.text = "!!"
        } else {
            emphasizeLabel.text = "!"
        }
        
        titleLabel.text = transition.memoTitle
        
        memoLabel.text = transition.memoContents
        
        if transition.enrollDate != "" {
            deadlineLabel.text = transition.enrollDate! + " "
        } else {
            deadlineLabel.text = nil
        }
        
        if transition.tag != "" {
            tagLabel.text = "#\(transition.tag)"
        } else {
            tagLabel.text = ""
        }
        
    }
    
}
