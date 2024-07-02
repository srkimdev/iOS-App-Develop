//
//  ResisterFirstTableViewCell.swift
//  Reminder Project
//
//  Created by 김성률 on 7/2/24.
//

import UIKit
import SnapKit

class RegisterFirstTableViewCell: UITableViewCell {

    let backgroundScene = UIView()
    
    let titleTextField = UITextField()
    let line = UIView()
    let memoTextView = UITextView()
    
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
        backgroundScene.addSubview(titleTextField)
        backgroundScene.addSubview(line)
        backgroundScene.addSubview(memoTextView)
        
    }
    
    func configureLayout() {
        
        backgroundScene.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide).inset(8)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(backgroundScene).offset(8)
            make.horizontalEdges.equalTo(backgroundScene).inset(8)
            make.height.equalTo(20)
        }
        
        line.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(backgroundScene).inset(8)
            make.height.equalTo(1)
        }
        
        memoTextView.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(backgroundScene).inset(8)
            make.bottom.equalTo(backgroundScene).inset(8)
        }
        
    }
    
    func configureUI() {
        
        backgroundScene.backgroundColor = .lightGray
        backgroundScene.layer.cornerRadius = 10
        
        titleTextField.placeholder = "제목"
        titleTextField.font = .systemFont(ofSize: 12)
        
        line.backgroundColor = .black
        
        memoTextView.backgroundColor = .lightGray
        
    }
    
}
