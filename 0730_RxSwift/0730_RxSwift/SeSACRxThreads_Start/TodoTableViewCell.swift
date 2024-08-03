//
//  TodoTableViewCell.swift
//  0730_RxSwift
//
//  Created by 김성률 on 8/3/24.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    let todoLabel = UILabel()
    let background = UIView()
    let checkButton = UIButton()
    let starButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func configureTodoCell(transition: todo) {
//        
//        todoLabel?.text = transition.chore
//        todoLabel?.font = .boldSystemFont(ofSize: 13)
//        background.backgroundColor = .systemGray6
//        background.layer.cornerRadius = 7
//        checkButton.tintColor = .black
//        starButton.tintColor = .black
//        
//        let check = transition.check ? "checkmark.square.fill" : "checkmark.square"
//        let star = transition.star ? "star.fill" : "star"
//        
//        checkButton.setImage(UIImage(systemName: check), for: .normal)
//        starButton.setImage(UIImage(systemName: star), for: .normal)
//        
//    }
//    
}
