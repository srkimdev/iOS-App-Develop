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
    
    @IBOutlet var result: UILabel!
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBOutlet var resetButton: UIButton!
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    
    var new_word: [String] = ["꾸안꾸", "억까", "사바사", "어쩔티비", "뇌피셜", "금사빠", "낄끼빠빠", "심쿵", "레게노", "국룰"]
    
    let meaning: [String] = ["꾸민듯 안꾸민듯 자연스러운 모습", "억지로 까다", "사람 바이 사람", "어쩌라고 티비나 봐", "자기 머리에서 나온 생각이 사실이나 검증된 것 마냥 말하는 행위", "금방 사랑에 빠지는 사람", "낄 때 끼고 빠질 때 빠져라", "심장이 쿵쾅쿵쾅", "레전드", "국민 룰"]
    
    var num: Int = 0
    
    var recent: [String] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15.0, height: 0.0))
        textField.leftViewMode = .always
        
        label1.text = "최근 검색어"
        label1.textColor = .black
        label1.font = .systemFont(ofSize: 20)
        label2.font = .systemFont(ofSize: 25)
        label2.layer.borderColor = UIColor.black.cgColor
        label2.layer.masksToBounds = true
        label2.layer.borderWidth = 2
        label2.layer.cornerRadius = 5
        
        result.text = "검색결과가 없습니다."
        result.textColor = .black
        result.textAlignment = .center
        result.lineBreakMode = .byWordWrapping
        result.numberOfLines = 2
        
        magnitude.backgroundColor = .black
        magnitude.tintColor = .white
        
        resetButton.setTitle("리셋", for: .normal)
        resetButton.setTitleColor(.red, for: .normal)
        resetButton.titleLabel?.font = .systemFont(ofSize: 20)
        
        
        for i in 0...3 {
            num = Int.random(in: 0...(9 - i))
            buttonCollection[i].setTitle(new_word[num], for: .normal)
            new_word.remove(at: num)
            
            buttonTag(button: buttonCollection[i])
        }
        
        new_word = ["꾸안꾸", "억까", "사바사", "어쩔티비", "뇌피셜", "금사빠", "낄끼빠빠", "심쿵", "레게노", "국룰"]
    }
    
    func buttonTag(button: UIButton) {
        
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    @IBAction func search(_ sender: UIButton) {
        
        if new_word.contains(textField.text!) {
            result.text = meaning[new_word.firstIndex(of: textField.text!)!]
            result.numberOfLines = 2
            
        } else {
            result.text = "검색결과가 없습니다."
        }
        
        for i in 0...3 {
            num = Int.random(in: 0...(9 - i))
            buttonCollection[i].setTitle(new_word[num], for: .normal)
            new_word.remove(at: num)
        }
        
        new_word = ["꾸안꾸", "억까", "사바사", "어쩔티비", "뇌피셜", "금사빠", "낄끼빠빠", "심쿵", "레게노", "국룰"]
        
        label2.text = label2.text! + " " + textField.text!
        
    }
    
    @IBAction func buttonAll(_ sender: UIButton) {
        
        result.text = meaning[new_word.firstIndex(of: buttonCollection[sender.tag].title(for: .normal)!)!]
        
    }
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        label2.text = ""
    }
    

}
