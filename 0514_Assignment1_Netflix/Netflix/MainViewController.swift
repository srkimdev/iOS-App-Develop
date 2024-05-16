//
//  MainViewController.swift
//  Netflix
//
//  Created by 김성률 on 5/16/24.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet var first_image: UIImageView!
    @IBOutlet var second_image: UIImageView!
    @IBOutlet var third_image: UIImageView!
    @IBOutlet var forth_image: UIImageView!
    @IBOutlet var cross_image: UIImageView!
    
    @IBOutlet var netflix_image: UIImageView!
    @IBOutlet var top_image: UIImageView!
    
    @IBOutlet var now_content: UILabel!
    @IBOutlet var list: UILabel!
    
    @IBOutlet var play: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        first_image.image = UIImage(named: "노량")
        first_image.contentMode = .scaleAspectFill
        first_image.layer.cornerRadius = 10
        
        second_image.image = UIImage(named: "오펜하이머")
        second_image.contentMode = .scaleAspectFill
        second_image.layer.cornerRadius = 5
        
        third_image.image = UIImage(named: "서울의봄")
        third_image.contentMode = .scaleAspectFill
        third_image.layer.cornerRadius = 5
        
        forth_image.image = UIImage(named: "아바타")
        forth_image.contentMode = .scaleAspectFill
        forth_image.layer.cornerRadius = 5
        
        netflix_image.image = UIImage(named: "single-large")
        top_image.image = UIImage(named: "top10 badge")
        
        now_content.text = "지금 뜨는 콘텐츠"
        now_content.textColor = .white
        now_content.numberOfLines = 1
        
        play.image = UIImage(named: "play_normal")
        play.contentMode = .scaleAspectFill
//        play.image = UIImage(named: )
        play.layer.cornerRadius = 5
        
        list.text = "내가 찜한 리스트"
        list.font = .systemFont(ofSize: 15)
        list.textColor = .white
        list.backgroundColor = .darkGray
        list.layer.cornerRadius = 5
        
        cross_image.layer.cornerRadius = 5
        
    }
    
    
    @IBAction func play_button(_ sender: UIButton) {
        
        let image1 = Int.random(in: 0...1)
        let image2 = Int.random(in: 0...1)
        
        if image1 == 0 {
            netflix_image.isHidden = true
        }
        else {
            netflix_image.isHidden = false
        }
        
        if image2 == 0 {
            top_image.isHidden = true
        }
        else {
            top_image.isHidden = false
        }
                
        
    }
    
}
