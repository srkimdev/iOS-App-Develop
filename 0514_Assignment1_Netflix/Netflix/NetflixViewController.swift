//
//  NetflixViewController.swift
//  Netflix
//
//  Created by 김성률 on 5/16/24.
//

import UIKit

class NetflixViewController: UIViewController {
    
    @IBOutlet var netflix: UILabel!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    
    @IBOutlet var bottom_label: UILabel!
    
    @IBOutlet var onoff: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        netflix.text = "JACKFLIX"
        netflix.textColor = .red
        netflix.font = .systemFont(ofSize: 30, weight: .heavy)
        netflix.textAlignment = .center
        
        designButton(button: button1, title: "이메일 주소 또는 전화번호", color: .lightGray, back: .darkGray)
        
        designButton(button: button2, title: "비밀번호", color: .lightGray, back: .darkGray)
        
        designButton(button: button3, title: "닉네임", color: .lightGray, back: .darkGray)
        
        designButton(button: button4, title: "위치", color: .lightGray, back: .darkGray)
        
        designButton(button: button5, title: "추천 코드 입력", color: .lightGray, back: .darkGray)
        
        designButton(button: button6, title: "회원가입", color: .black, back: .white)
        
        
        bottom_label.text = "추가 정보 입력"
        bottom_label.textColor = .white
        
        onoff.onTintColor = .red
    }
    
    func designButton(button: UIButton, title: String, color: UIColor, back: UIColor) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.backgroundColor = back
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
//        button.contentMode = .center
    }
    

}
