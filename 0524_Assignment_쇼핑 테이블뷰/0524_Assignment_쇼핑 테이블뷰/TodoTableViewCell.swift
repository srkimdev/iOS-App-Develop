//
//  TodoTableViewCell.swift
//  0524_Assignment_쇼핑 테이블뷰
//
//  Created by 김성률 on 5/24/24.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet var todoLabel: UILabel!
    @IBOutlet var background: UIView!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var starButton: UIButton!
    
    func configureTodoCell(transition: todo) {
        
        todoLabel?.text = transition.chore
        todoLabel?.font = .boldSystemFont(ofSize: 13)
        background.backgroundColor = .systemGray6
        background.layer.cornerRadius = 7
        checkButton.tintColor = .black
        starButton.tintColor = .black
        
        let check = transition.check ? "checkmark.square.fill" : "checkmark.square"
        let star = transition.star ? "star.fill" : "star"
        
        checkButton.setImage(UIImage(systemName: check), for: .normal)
        starButton.setImage(UIImage(systemName: star), for: .normal)
        
    }
    
}
