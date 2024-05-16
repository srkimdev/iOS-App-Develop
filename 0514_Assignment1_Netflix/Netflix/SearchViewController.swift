//
//  SearchViewController.swift
//  Netflix
//
//  Created by 김성률 on 5/16/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet var information: UILabel!
    @IBOutlet var information2: UILabel!
    
    @IBOutlet var engine: UITextField!
    
    @IBOutlet var first_image: UIImageView!
    @IBOutlet var second_image: UIImageView!
    @IBOutlet var thirt_image: UIImageView!
    
    @IBOutlet var first_label: UILabel!
    @IBOutlet var second_label: UILabel!
    @IBOutlet var third_label: UILabel!
    
    @IBOutlet var circle_image1: UIImageView!
    @IBOutlet var circle_image2: UIImageView!
    @IBOutlet var circle_image3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        information.text = "이런! 찾으시는 작품이 없습니다."
        
        information.textColor = .white
        information.font = .systemFont(ofSize: 25, weight: .heavy)
        information.textAlignment = .center
        
        
        information2.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        information2.font = .systemFont(ofSize: 15)
        information2.textColor = .gray
        information2.textAlignment = .center
    
        first_image.image = UIImage(named: "blue")
        second_image.image = UIImage(named: "turquoise")
        thirt_image.image = UIImage(named: "pink")
        
        first_label.text = "공개 예정"
        first_label.textColor = .black
        first_label.font = .systemFont(ofSize: 10)
        
        second_label.text = "모두의 인기 콘텐츠"
        second_label.textColor = .white
        second_label.font = .systemFont(ofSize: 10)
        
        third_label.text = "TOP 10 시리즈"
        third_label.textColor = .white
        third_label.font = .systemFont(ofSize: 10)
        
        engine.placeholder = "게임, 시리즈, 영화를 검색하세요..."
        circle_image1.layer.cornerRadius = 20
        circle_image1.backgroundColor = .white
        
        circle_image2.layer.cornerRadius = 20
        circle_image2.backgroundColor = .black
        
        circle_image3.layer.cornerRadius = 20
        circle_image3.backgroundColor = .black
        
        engine.attributedPlaceholder = NSAttributedString(string: "게임, 시리즈, 영화를 검색하세요...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        
    }
    
    @IBAction func first_bt(_ sender: UIButton) {
        
        first_label.textColor = .black
        second_label.textColor = .white
        third_label.textColor = .white
        
        information.text = "이런! 찾으시는 작품이 없습니다."
        
        information.textColor = .white
        information.font = .systemFont(ofSize: 25, weight: .heavy)
        information.textAlignment = .center
        
        
        information2.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        information2.font = .systemFont(ofSize: 15)
        information2.textColor = .gray
        information2.textAlignment = .center
        
        circle_image1.backgroundColor = .white
        circle_image2.backgroundColor = .black
        circle_image3.backgroundColor = .black
        
        
    }
    
    
    @IBAction func second_bt(_ sender: UIButton) {
        
        first_label.textColor = .white
        second_label.textColor = .black
        third_label.textColor = .white
        
        information.text = "두번째"
        
        information.textColor = .white
        information.font = .systemFont(ofSize: 25, weight: .heavy)
        information.textAlignment = .center
        
        
        information2.text = "22"
        information2.font = .systemFont(ofSize: 15)
        information2.textColor = .gray
        information2.textAlignment = .center
        
        circle_image1.backgroundColor = .black
        circle_image2.backgroundColor = .white
        circle_image3.backgroundColor = .black
        
        
    }
    
    @IBAction func third_bt(_ sender: UIButton) {
        
        first_label.textColor = .white
        second_label.textColor = .white
        third_label.textColor = .black
        
        
        information.text = "세번째"
        
        information.textColor = .white
        information.font = .systemFont(ofSize: 25, weight: .heavy)
        information.textAlignment = .center
        
        
        information2.text = "33"
        information2.font = .systemFont(ofSize: 15)
        information2.textColor = .gray
        information2.textAlignment = .center
        
        circle_image1.backgroundColor = .black
        circle_image2.backgroundColor = .black
        circle_image3.backgroundColor = .white
        
    }
    
}
