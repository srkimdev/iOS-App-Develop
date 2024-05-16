//
//  NetflixViewController.swift
//  Netflix
//
//  Created by 김성률 on 5/16/24.
//

import UIKit

class NetflixViewController: UIViewController {
    
    @IBOutlet var netflix: UILabel!
    
    @IBOutlet var first_label: UILabel!
    @IBOutlet var second_label: UILabel!
    @IBOutlet var third_label: UILabel!
    @IBOutlet var forth_label: UILabel!
    @IBOutlet var fifth_label: UILabel!
    @IBOutlet var sixth_label: UILabel!
    
    @IBOutlet var bottom_label: UILabel!
    
    @IBOutlet var first_image: UIImageView!
    @IBOutlet var second_image: UIImageView!
    @IBOutlet var third_image: UIImageView!
    @IBOutlet var forth_image: UIImageView!
    @IBOutlet var fifth_image: UIImageView!
    @IBOutlet var sixth_image: UIImageView!
    
    @IBOutlet var onoff: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        netflix.text = "JACKFLIX"
        netflix.textColor = .red
        netflix.font = .systemFont(ofSize: 30, weight: .heavy)
        netflix.textAlignment = .center
        
        
        first_label.text = "이메일 주소 또는 전화번호"
        first_label.textColor = .lightGray
        first_label.textAlignment = .center
        
        second_label.text = "비밀번호"
        second_label.textColor = .lightGray
        second_label.textAlignment = .center
        
        third_label.text = "닉네임"
        third_label.textColor = .lightGray
        third_label.textAlignment = .center
        
        forth_label.text = "위치"
        forth_label.textColor = .lightGray
        forth_label.textAlignment = .center
        
        fifth_label.text = "추천 코드 입력"
        fifth_label.textColor = .lightGray
        fifth_label.textAlignment = .center
        
        sixth_label.text = "회원가입"
        sixth_label.textColor = .black
        sixth_label.textAlignment = .center
        
        first_image.backgroundColor = .darkGray
        first_image.layer.cornerRadius = 5
        
        second_image.backgroundColor = .darkGray
        second_image.layer.cornerRadius = 5
        
        third_image.backgroundColor = .darkGray
        third_image.layer.cornerRadius = 5
        
        forth_image.backgroundColor = .darkGray
        forth_image.layer.cornerRadius = 5
        
        fifth_image.backgroundColor = .darkGray
        fifth_image.layer.cornerRadius = 5
        
        sixth_image.backgroundColor = .white
        sixth_image.layer.cornerRadius = 5
        
        bottom_label.text = "추가 정보 입력"
        bottom_label.textColor = .white
        
        onoff.onTintColor = .red
    }
    

}
