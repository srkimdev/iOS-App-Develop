//
//  TodoTableViewCell.swift
//  0730_RxSwift
//
//  Created by 김성률 on 8/3/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class TodoTableViewCell: UITableViewCell {
    
    let background = UIView()
    let checkButton = UIButton()
    let todoLabel = UILabel()
    let starButton = UIButton()
    
    var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
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
        contentView.addSubview(background)
        background.addSubview(checkButton)
        background.addSubview(todoLabel)
        background.addSubview(starButton)
    }
    
    func configureLayout() {
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(4)
        }
        
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(background.snp.top).offset(8)
            make.leading.equalTo(background.snp.leading).offset(16)
            make.bottom.equalTo(background.snp.bottom).inset(8)
        }
        
        todoLabel.snp.makeConstraints { make in
            make.top.equalTo(background.snp.top).offset(8)
            make.leading.equalTo(checkButton.snp.trailing).offset(16)
            make.bottom.equalTo(background.snp.bottom).inset(8)
        }
        
        starButton.snp.makeConstraints { make in
            make.top.equalTo(background.snp.top).offset(8)
            make.trailing.equalTo(background.snp.trailing).inset(16)
            make.bottom.equalTo(background.snp.bottom).inset(8)
        }
    }
    
    func configureUI() {
        background.backgroundColor = .systemGray6
        background.layer.cornerRadius = 7
        
        todoLabel.textColor = .black
        todoLabel.font = .boldSystemFont(ofSize: 13)
        
        checkButton.tintColor = .black
        starButton.tintColor = .black
    }
    
    func designCell(transition: todo) {
        todoLabel.text = transition.chore

        let check = transition.check ? "checkmark.square.fill" : "checkmark.square"
        let star = transition.star ? "star.fill" : "star"

        checkButton.setImage(UIImage(systemName: check), for: .normal)
        starButton.setImage(UIImage(systemName: star), for: .normal)
    }
}
