//
//  SecondViewController.swift
//  0517_Assignment1_감정 다이어리
//
//  Created by 김성률 on 5/18/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var magnitude: UIButton!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    
    @IBOutlet var result: UILabel!
    
    let new_word: [String] = ["꾸안꾸", "억까", "사바사", "어쩔티비", "뇌피셜", "금사빠", "낄끼빠빠", "심쿵", "레게노", "국룰"]
    
    var meaning: [String] = ["A", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        result.text = "찾는 결과가 없습니다."
        result.textColor = .black
        result.textAlignment = .center

        let num1: Int = .random(in: 0...9)
//        new_word.remove(at: num1)
        
        let num2: Int = .random(in: 0...9)
//        new_word.remove(at: num2)
        
        let num3: Int = .random(in: 0...9)
//        new_word.remove(at: num3)
        
        let num4: Int = .random(in: 0...9)
//        new_word.remove(at: num4)
        
        button1.setTitle(new_word[num1], for: .normal)
        button2.setTitle(new_word[num2], for: .normal)
        button3.setTitle(new_word[num3], for: .normal)
        button4.setTitle(new_word[num4], for: .normal)
        
        button1.layer.masksToBounds = true
        button1.layer.cornerRadius = 10
        button1.setTitleColor(.black, for: .normal)
        button1.layer.borderColor = UIColor.black.cgColor
        button1.layer.borderWidth = 1
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        button2.layer.masksToBounds = true
        button2.layer.cornerRadius = 10
        button2.setTitleColor(.black, for: .normal)
        button2.layer.borderColor = UIColor.black.cgColor
        button2.layer.borderWidth = 1
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        button3.layer.masksToBounds = true
        button3.layer.cornerRadius = 10
        button3.setTitleColor(.black, for: .normal)
        button3.layer.borderColor = UIColor.black.cgColor
        button3.layer.borderWidth = 1
        button3.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        button4.layer.masksToBounds = true
        button4.layer.cornerRadius = 10
        button4.setTitleColor(.black, for: .normal)
        button4.layer.borderColor = UIColor.black.cgColor
        button4.layer.borderWidth = 1
        button4.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
    }
    
    @IBAction func search(_ sender: UIButton) {
        
        if new_word.contains(textField.text!) {
            result.text = meaning[new_word.firstIndex(of: textField.text!)!]
            
        } else {
            
            result.text = "찾는 결과가 없습니다."
        }
        
        
    }
    

}
