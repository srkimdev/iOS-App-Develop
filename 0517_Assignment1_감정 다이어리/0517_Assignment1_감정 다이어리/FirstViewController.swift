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
    
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    
    var saveToggle: Bool = false
    
    var count: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let emotion: [String] = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "따분해", "걱정해"]
    var num: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designButton(button: saveButton, buttonName: "저장", color: .blue)
        designButton(button: resetButton, buttonName: "리셋", color: .red)
        
        view.backgroundColor = .brown
        
        top_label.text = "감정 다이어리"
        top_label.textColor = .black
        top_label.font = .systemFont(ofSize: 20)
        top_label.textAlignment = .center
    
        for i in 0...8 {
            count[i] = UserDefaults.standard.integer(forKey: "\(i)key")
            
            designLabelName(emotionName: emotion[i], labelName: labelList[i], count: count[i])
        }
    }
    
    // 초기 랜덤으로 숫자 부여
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
    
    func designButton(button: UIButton, buttonName: String, color: UIColor) {
        button.setTitle(buttonName, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
    }
    
    @IBAction func buttonUp(_ sender: UIButton) {
        
        count[sender.tag] += 1

        labelList[sender.tag].text = "\(emotion[sender.tag]) \(count[sender.tag])"
    }
    
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        
        for i in 0...8 {
            UserDefaults.standard.set(count[i], forKey: "\(i)key")
        }
        
    }
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        for i in 0...8 {
            count[i] = 0
            designLabelName(emotionName: emotion[i], labelName: labelList[i], count: count[i])
            UserDefaults.standard.set(0, forKey: "\(i)key")
        }
    }
}
