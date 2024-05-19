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
    @IBOutlet var stackView: UIStackView!
    
    
    var new_word: [String] = ["꾸안꾸", "억까", "사바사", "어쩔티비", "뇌피셜", "금사빠", "낄끼빠빠", "심쿵", "레게노", "국룰"]
    
    let meaning: [String] = ["꾸민듯 안꾸민듯 자연스러운 모습", "억지로 까다", "사람 바이 사람", "어쩌라고 티비나 봐", "자기 머리에서 나온 생각이 사실이나 검증된 것 마냥 말하는 행위", "금방 사랑에 빠지는 사람", "낄 때 끼고 빠질 때 빠져라", "심장이 쿵쾅쿵쾅", "레전드", "국민 룰"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15.0, height: 0.0))
        textField.leftViewMode = .always
        
        result.text = "검색결과가 없습니다."
        result.textColor = .black
        result.textAlignment = .center
        result.lineBreakMode = .byWordWrapping
        result.numberOfLines = 2
        
        magnitude.backgroundColor = .black
        magnitude.tintColor = .white

        let num1: Int = .random(in: 0...9)
        button1.setTitle(new_word[num1], for: .normal)
        new_word.remove(at: num1)
        
        let num2: Int = .random(in: 0...8)
        button2.setTitle(new_word[num2], for: .normal)
        new_word.remove(at: num2)
        
        let num3: Int = .random(in: 0...7)
        button3.setTitle(new_word[num3], for: .normal)
        new_word.remove(at: num3)
        
        let num4: Int = .random(in: 0...6)
        button4.setTitle(new_word[num4], for: .normal)
        
        new_word = ["꾸안꾸", "억까", "사바사", "어쩔티비", "뇌피셜", "금사빠", "낄끼빠빠", "심쿵", "레게노", "국룰"]
        
        button1.layer.masksToBounds = true
        button1.layer.cornerRadius = 10
        button1.setTitleColor(.black, for: .normal)
        button1.layer.borderColor = UIColor.black.cgColor
        button1.layer.borderWidth = 1
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button1.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        button2.layer.masksToBounds = true
        button2.layer.cornerRadius = 10
        button2.setTitleColor(.black, for: .normal)
        button2.layer.borderColor = UIColor.black.cgColor
        button2.layer.borderWidth = 1
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button2.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        button3.layer.masksToBounds = true
        button3.layer.cornerRadius = 10
        button3.setTitleColor(.black, for: .normal)
        button3.layer.borderColor = UIColor.black.cgColor
        button3.layer.borderWidth = 1
        button3.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button3.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        button4.layer.masksToBounds = true
        button4.layer.cornerRadius = 10
        button4.setTitleColor(.black, for: .normal)
        button4.layer.borderColor = UIColor.black.cgColor
        button4.layer.borderWidth = 1
        button4.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button4.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    @IBAction func search(_ sender: UIButton) {

        if new_word.contains(textField.text!) {
            result.text = meaning[new_word.firstIndex(of: textField.text!)!]
            result.numberOfLines = 2
            
        } else {
            result.text = "검색결과가 없습니다."
        }
        
        let num1: Int = .random(in: 0...9)
        button1.setTitle(new_word[num1], for: .normal)
        new_word.remove(at: num1)
        
        let num2: Int = .random(in: 0...8)
        button2.setTitle(new_word[num2], for: .normal)
        new_word.remove(at: num2)
        
        let num3: Int = .random(in: 0...7)
        button3.setTitle(new_word[num3], for: .normal)
        new_word.remove(at: num3)
        
        let num4: Int = .random(in: 0...6)
        button4.setTitle(new_word[num4], for: .normal)
        
        new_word = ["꾸안꾸", "억까", "사바사", "어쩔티비", "뇌피셜", "금사빠", "낄끼빠빠", "심쿵", "레게노", "국룰"]
    }
    
    @IBAction func button1(_ sender: UIButton) {
        result.text = meaning[new_word.firstIndex(of: button1.title(for: .normal)!)!]
    }
    
    @IBAction func button2(_ sender: UIButton) {
        result.text = meaning[new_word.firstIndex(of: button2.title(for: .normal)!)!]
    }
    
    @IBAction func button3(_ sender: UIButton) {
        result.text = meaning[new_word.firstIndex(of: button3.title(for: .normal)!)!]
    }
    
    @IBAction func button4(_ sender: UIButton) {
        result.text = meaning[new_word.firstIndex(of: button4.title(for: .normal)!)!]
    }
}
