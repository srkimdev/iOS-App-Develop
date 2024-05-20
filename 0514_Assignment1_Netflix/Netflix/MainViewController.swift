//
//  MainViewController.swift
//  Netflix
//
//  Created by 김성률 on 5/16/24.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet var mainImage: UIImageView!
    
    @IBOutlet var subImage1: UIImageView!
    @IBOutlet var subImage2: UIImageView!
    @IBOutlet var subImage3: UIImageView!
    
    @IBOutlet var netflix_image: UIImageView!
    @IBOutlet var top_image: UIImageView!
    
    @IBOutlet var now_content: UILabel!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    
    var movies = ["노량", "더퍼스트슬램덩크", "밀수", "범죄도시3", "서울의봄", "스즈메의문단속", "아바타물의길", "오펜하이머", "육사오", "콘크리트유토피아"]
    
    var num: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        designImage(image: "노량", imageLocate: mainImage)
        
        designImage(image: "오펜하이머", imageLocate: subImage1)
        
        designImage(image: "서울의봄", imageLocate: subImage2)
        
        designImage(image: "아바타", imageLocate: subImage3)
        
        netflix_image.image = UIImage(named: "single-large")
        top_image.image = UIImage(named: "top10 badge")
        
        // ---- label ----
        
        now_content.text = "지금 뜨는 콘텐츠"
        now_content.textColor = .white
        now_content.numberOfLines = 1
        
        
        // ---- button ----
        
        button1.contentMode = .scaleAspectFill
        button1.layer.masksToBounds = true
        button1.layer.cornerRadius = 5
        
        button2.setTitle("내가 찜한 리스트", for: .normal)
        button2.setTitleColor(.white, for: .normal)
        button2.layer.masksToBounds = true
        button2.layer.cornerRadius = 5
        button2.titleLabel?.font = .systemFont(ofSize: 15)
        button2.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 8)
        
        
    }
    
    func designImage(image: String, imageLocate: UIImageView) {
        
        imageLocate.image = UIImage(named: image)
        imageLocate.contentMode = .scaleAspectFill
        imageLocate.layer.cornerRadius = 10
        
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        
        num = Int.random(in: 0...9)
        mainImage.image = UIImage(named: movies[num])
        movies.remove(at: num)

        num = Int.random(in: 0...8)
        subImage1.image = UIImage(named: movies[num])
        movies.remove(at: num)

        num = Int.random(in: 0...7)
        subImage2.image = UIImage(named: movies[num])
        movies.remove(at: num)

        num = Int.random(in: 0...6)
        subImage3.image = UIImage(named: movies[num])
        
        movies = ["노량", "더퍼스트슬램덩크", "밀수", "범죄도시3", "서울의봄", "스즈메의문단속", "아바타물의길", "오펜하이머", "육사오", "콘크리트유토피아"]
    }
    
    
    @IBAction func randomImage(_ sender: UIButton) {
        
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
