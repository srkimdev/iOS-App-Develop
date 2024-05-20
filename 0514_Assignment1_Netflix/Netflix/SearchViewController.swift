//
//  SearchViewController.swift
//  Netflix
//
//  Created by 김성률 on 5/16/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var image: UIImageView!
    @IBOutlet var textFieldUI: UIImageView!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        textFieldUI.layer.masksToBounds = true
        textFieldUI.layer.cornerRadius = 3
        textFieldUI.backgroundColor = .darkGray
        
        // ---- button ----
        
        designButton(button: button1, title: "공개 예정", background: .white, textColor: .black)
        
        designButton(button: button2, title: "모두의 인기 콘텐츠", background: .black, textColor: .white)
        
        designButton(button: button3, title: "TOP 10 시리즈", background: .black, textColor: .white)
        
        // ---- textField ----
        
        textField.placeholder = "게임, 시리즈, 영화를 검색하세요..."
    
        textField.attributedPlaceholder = NSAttributedString(string: "게임, 시리즈, 영화를 검색하세요...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        textField.backgroundColor = .darkGray
        
        // ---- label ----
        
        designLabel1(label: label1, text1: "이런! 찾으시는 작품이 없습니다.")
        
        designLabel2(label: label2, text2: "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요.")
        
    }
    
    func designButton(button: UIButton, title: String, background: UIColor, textColor: UIColor) {
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.backgroundColor = background
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 8)
        
    }
    
    func designLabel1(label: UILabel, text1: String) {
        
        label.text = text1
        label.textColor = .white
        label.font = .systemFont(ofSize: 25, weight: .heavy)
        label.textAlignment = .center
    }
    
    func designLabel2(label: UILabel, text2: String) {
        
        label.text = text2
        label.textColor = .gray
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
    }
    
    
    @IBAction func button1(_ sender: UIButton) {
        
        designButton(button: button1, title: "공개 예정", background: .white, textColor: .black)
        
        designButton(button: button2, title: "모두의 인기 콘텐츠", background: .black, textColor: .white)
        
        designButton(button: button3, title: "TOP 10 시리즈", background: .black, textColor: .white)
        
        designLabel1(label: label1, text1: "이런! 찾으시는 작품이 없습니다.")
        
        designLabel2(label: label2, text2: "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요.")
        
    }
    
    @IBAction func button2(_ sender: UIButton) {
        
        designButton(button: button1, title: "공개 예정", background: .black, textColor: .white)
        
        designButton(button: button2, title: "모두의 인기 콘텐츠", background: .white, textColor: .black)
        
        designButton(button: button3, title: "TOP 10 시리즈", background: .black, textColor: .white)
        
        designLabel1(label: label1, text1: "두번째")
        
        designLabel2(label: label2, text2: "22")
        
    }
    
    @IBAction func button3(_ sender: UIButton) {
        
        designButton(button: button1, title: "공개 예정", background: .black, textColor: .white)
        
        designButton(button: button2, title: "모두의 인기 콘텐츠", background: .black, textColor: .white)
        
        designButton(button: button3, title: "TOP 10 시리즈", background: .white, textColor: .black)
        
        designLabel1(label: label1, text1: "세번째")
        
        designLabel2(label: label2, text2: "33")
        
    }
    
}
