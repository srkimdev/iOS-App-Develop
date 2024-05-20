//
//  FirstViewController.swift
//  0517_Assignment1_감정 다이어리
//
//  Created by 김성률 on 5/18/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet var top_label: UILabel!
    
    @IBOutlet var labelList: [UILabel]!
    
    var count: [Int] = []
    let emotion: [String] = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "따분해", "걱정해"]
    var num: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        
        top_label.text = "감정 다이어리"
        top_label.textColor = .black
        top_label.font = .systemFont(ofSize: 20)
        top_label.textAlignment = .center
        
        initialRandomNumber()
    
        for i in 0...8 {
            designLabelName(emotionName: emotion[i], labelName: labelList[i], count: count[i])
        }
        
    }
    
    func initialRandomNumber() {
        var num: Int = 0
        
        for _ in 0...8 {
            num = Int.random(in: 1...50)
            count.append(num)
        }
    }
    
    func designLabelName(emotionName: String, labelName: UILabel, count: Int) {
        labelName.text = "\(emotionName) \(count)"
        labelName.textAlignment = .center
        labelName.textColor = .black
    }
    
    @IBAction func buttonUp(_ sender: UIButton) {
        
        count[sender.tag] += 1

        labelList[sender.tag].text = "\(emotion[sender.tag]) \(count[sender.tag])"
    }
    
    
}
