//
//  MainViewController.swift
//  0521_Assignment1_BMI 계산기
//
//  Created by 김성률 on 5/21/24.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var title1: UILabel!
    @IBOutlet var title2: UILabel!
    
    @IBOutlet var question1: UILabel!
    @IBOutlet var question2: UILabel!
    @IBOutlet var question3: UILabel!
    
    @IBOutlet var textField1: UITextField!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textField3: UITextField!
    
    @IBOutlet var randomButton: UIButton!
    @IBOutlet var resultButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    
    
    @IBOutlet var uiView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show save data
        let height = UserDefaults.standard.string(forKey: "height")
        
        let weight = UserDefaults.standard.string(forKey: "weight")
        
        let nickname = UserDefaults.standard.string(forKey: "nickname")
        
        textField1.text = height
        textField2.text = weight
        textField3.text = nickname
        
        
        // ---- title1, 2 ----
        title1.font = .systemFont(ofSize: 25, weight: .heavy)
        
        title2.font = .systemFont(ofSize: 15)
        title2.numberOfLines = 0
        
        designTitle(label: title1, title: "BMI Calculator")
        designTitle(label: title2, title: "당신의 BMI 지수를 알려드릴게요.")
        
        // ---- UIView ----
        uiView.layer.cornerRadius = 10
        uiView.layer.borderWidth = 2
        uiView.layer.borderColor = UIColor.black.cgColor

        // ---- Button ----
        designButton(button: randomButton, buttonName: "랜덤으로 BMI 계산하기", buttonColor: .red)
        
        designButton(button: resultButton, buttonName: "결과 확인", buttonColor: .white)
        
        resultButton.backgroundColor = .purple
        resultButton.layer.masksToBounds = true
        resultButton.layer.cornerRadius = 15
        resultButton.titleLabel?.font = .systemFont(ofSize: 20)

        designButton(button: saveButton, buttonName: "저장하기", buttonColor: .blue)
        
        designButton(button: resetButton, buttonName: "리셋", buttonColor: .red)
        
        // ---- question ----
        
        designQuestionText(label: question1, question: "키가 어떻게 되시나요?")
        
        designQuestionText(label: question2, question: "몸무게는 어떻게 되시나요?")
        
        designQuestionText(label: question3, question: "닉네임 설정")
        
        // ---- textfield ----
        designTextField(textField: textField1)
        designTextField(textField: textField3)
        
        textField2.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10.0, height: 0.0))
        textField2.leftViewMode = .always
        textField2.layer.borderColor = UIColor.white.cgColor
    }
    
    func designTitle(label: UILabel, title: String) {
        
        label.text = title
        label.textColor = .black
        
    }
    
    func designQuestionText(label: UILabel, question: String) {
        
        label.text = question
        label.textColor = .black
        label.backgroundColor = .white
        
    }
    
    func resultButtonClicked() -> String {
        
        var text: String = ""
        var height: Double = 0
        var weight: Double = 0
        
        if textField1.text! == nil || textField2.text! == nil {
            
            text = "잘못 입력하셨습니다."
            
        } else if Double(textField1.text!) == nil || Double(textField2.text!) == nil {
            
            text = "잘못 입력하셨습니다."
            
        } else if Double(textField1.text!)! < 150 || Double(textField1.text!)! > 200 {
            
            text = "키의 범위를 다시 확인해주세요.\n 150~199"
            
        } else if Double(textField2.text!)! < 40 || Double(textField2.text!)! > 121 {
            
            text = "몸무게의 범위를 다시 확인해주세요.\n 40~120"
            
        } else {
            
            height = Double(textField1.text!)!
            weight = Double(textField2.text!)!
            
            let bmi = weight / ((height / 100) * (height / 100))
                                
            text = String(format: "%.3f", bmi)
        }
    
        return text

    }
    
    func designTextField(textField: UITextField) {
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5.0, height: 0.0))
        textField.leftViewMode = .always
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 10
    }
    
    func designButton(button: UIButton, buttonName: String, buttonColor: UIColor) {
        
        button.setTitle(buttonName, for: .normal)
        button.setTitleColor(buttonColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        
        let result: String = resultButtonClicked()
        
        let alert = UIAlertController(
            title: "BMI",
            message: result,
            preferredStyle: .alert)
        
        let check = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(check)

        present(alert, animated: true)
        
        
    }
    
    @IBAction func randomButton(_ sender: UIButton) {
        
        let height: Int = .random(in: 150...200)
        let weight: Int = .random(in: 40...120)
        
        textField1.text = "\(height)"
        textField2.text = "\(weight)"
    }
    
    @IBAction func blindButton(_ sender: UIButton) {
        
        textField2.isSecureTextEntry.toggle()
        
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        
        UserDefaults.standard.set(textField1.text, forKey: "height")
        
        UserDefaults.standard.set(textField2.text, forKey: "weight")
        
        UserDefaults.standard.set(textField3.text, forKey: "nickname")
        
    }
    
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        
        textField1.text = ""
        textField2.text = ""
        textField3.text = ""
        
        UserDefaults.standard.set("", forKey: "height")
        
        UserDefaults.standard.set("", forKey: "weight")
        
        UserDefaults.standard.set("", forKey: "nickname")
        
    }
    
    

}
