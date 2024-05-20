//
//  StorageViewController.swift
//  Netflix
//
//  Created by 김성률 on 5/16/24.
//

import UIKit

class StorageViewController: UIViewController {

    @IBOutlet var first_label: UILabel!
    @IBOutlet var second_label: UILabel!
    @IBOutlet var third_label: UILabel!
    @IBOutlet var forth_label: UILabel!
    
    
    @IBOutlet var first_button: UIButton!
    @IBOutlet var second_button: UIButton!
    
    @IBOutlet var iimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        first_label.text = "'나만의 자동 저장' 기능"
        first_label.textColor = .white
        first_label.font = .systemFont(ofSize: 20)
        first_label.textAlignment = .center
        
        second_label.text = "취향에 맞는 영화와 시리즈를 자동으로 설정해 드립니다.\n 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요."
        second_label.textColor = .gray
        
        second_label.font = .systemFont(ofSize: 10)
        second_label.textAlignment = .center
        second_label.numberOfLines = 2
    
        third_label.text = "설정하기"
        third_label.textColor = .white
        third_label.font = .systemFont(ofSize: 15, weight: .heavy)
        third_label.textAlignment = .center
        
        forth_label.text = "저장 가능한 콘텐츠 살펴보기"
        forth_label.textColor = .black
        forth_label.font = .systemFont(ofSize: 15, weight: .heavy)
        forth_label.textAlignment = .center

        first_button.backgroundColor = .systemBlue
        second_button.backgroundColor = .white
        
        iimage.image = UIImage(named: "dummy")
        iimage.contentMode = .scaleAspectFit
        
    }

}
