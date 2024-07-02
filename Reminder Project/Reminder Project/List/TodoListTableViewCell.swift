//
//  TodoListTableViewCell.swift
//  Reminder Project
//
//  Created by 김성률 on 7/2/24.
//

import UIKit
import SnapKit

class TodoListTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let memoLabel = UILabel()
    let deadlineLabel = UILabel()

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
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(memoLabel)
        contentView.addSubview(deadlineLabel)
        
    }
    
    func configureLayout() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(8)
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(4)
            make.height.equalTo(14)
        }
        
        memoLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(4)
            make.height.equalTo(12)
        }
        
        deadlineLabel.snp.makeConstraints { make in
            make.top.equalTo(memoLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(4)
            make.height.equalTo(12)
        }
        
    }
    
    func configureUI() {
        
        contentView.backgroundColor = .lightGray
        
        titleLabel.text = "키보드 구매"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 14)
        
        memoLabel.text = "예쁜 키캡 알아보기"
        memoLabel.textColor = .gray
        memoLabel.font = .systemFont(ofSize: 13)
        
        deadlineLabel.text = "2024. 2. 20"
        deadlineLabel.textColor = .gray
        deadlineLabel.font = .systemFont(ofSize: 13)
        
    }
    

}
