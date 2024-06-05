//
//  ViewController.swift
//  0605_Assignment_로또
//
//  Created by 김성률 on 6/5/24.
//

import UIKit
import SnapKit
import Alamofire

struct Lotto: Decodable {
    let drwNoDate: String
    
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
    
    let drwNo: Int

}


class ViewController: UIViewController {

    let numberTextField = UITextField()
    let numInfoLabel = UILabel()
    let dateLabel = UILabel()
    let line = UIView()
    let resultLabel = UILabel()
    
    let circle1 = UILabel()
    let circle2 = UILabel()
    let circle3 = UILabel()
    let circle4 = UILabel()
    let circle5 = UILabel()
    let circle6 = UILabel()
    let circle7 = UILabel()
    var circleArray: [UILabel] = []
    
    let plusImage = UIImageView()
    let bonusLabel = UILabel()
    
    let pickerView = UIPickerView()
    
    var list: [Lotto] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleArray = [circle1, circle2, circle3, circle4, circle5, circle6, circle7]
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        numberTextField.inputView = pickerView
        
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1100"
        callRequest(url: url)
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for item in circleArray {
            designCircle(circle: item)
        }
    
    }
    
    func configureHierarchy() {
        
        view.addSubview(numberTextField)
        view.addSubview(numInfoLabel)
        view.addSubview(dateLabel)
        view.addSubview(line)
        view.addSubview(resultLabel)
        
        view.addSubview(circle1)
        view.addSubview(circle2)
        view.addSubview(circle3)
        view.addSubview(circle4)
        view.addSubview(circle5)
        view.addSubview(circle6)
        view.addSubview(circle7)
        
        view.addSubview(plusImage)
        view.addSubview(bonusLabel)
        
    }
    
    func configureLayout() {
        
        numberTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.height.equalTo(50)
        }
        
        numInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(25)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.height.equalTo(20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(25)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-25)
            make.height.equalTo(20)
        }
        
        line.snp.makeConstraints { make in
            make.top.equalTo(numInfoLabel.snp.bottom).offset(12)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-25)
            make.height.equalTo(1)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(35)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(300)
        }
        
        circle1.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        circle2.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(30)
            make.leading.equalTo(circle1.snp.trailing).offset(4)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        circle3.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(30)
            make.leading.equalTo(circle2.snp.trailing).offset(4)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        circle4.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(30)
            make.leading.equalTo(circle3.snp.trailing).offset(4)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        circle5.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(30)
            make.leading.equalTo(circle4.snp.trailing).offset(4)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        circle6.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(30)
            make.leading.equalTo(circle5.snp.trailing).offset(4)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        circle7.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-25)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        plusImage.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(42)
            make.leading.equalTo(circle6.snp.trailing).offset(16)
            make.trailing.equalTo(circle7.snp.leading).offset(-16)
            make.height.equalTo(16)
            make.width.equalTo(12)
        }
        
        bonusLabel.snp.makeConstraints { make in
            make.top.equalTo(circle7.snp.bottom).offset(4)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
        
        
        
    }
    
    func configureUI() {
        
        numberTextField.layer.cornerRadius = 5
        numberTextField.backgroundColor = .white
        numberTextField.layer.borderWidth = 1
        numberTextField.layer.borderColor = UIColor.lightGray.cgColor
        numberTextField.textAlignment = .center
        
        numInfoLabel.text = "당첨번호 안내"
        numInfoLabel.font = .systemFont(ofSize: 15)
        
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 13)
        
        line.backgroundColor = .lightGray
        
        resultLabel.textAlignment = .center
        resultLabel.font = .systemFont(ofSize: 20)
        
        plusImage.image = UIImage(systemName: "plus")
        plusImage.tintColor = .black
        
        bonusLabel.text = "보너스"
        bonusLabel.textColor = .gray
        bonusLabel.font = .systemFont(ofSize: 12)
        bonusLabel.textAlignment = .center
        
    }
    
    func callRequest(url: String) {
        
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):

                let text = "\(value.drwNo)회 당첨결과"
                let attributedString = NSMutableAttributedString(string: text)
                if let range = text.range(of: "\(value.drwNo)회") {
                    let nsRange = NSRange(range, in: text)
                    attributedString.addAttribute(.foregroundColor, value: #colorLiteral(red: 0.9916900992, green: 0.7964017987, blue: 0, alpha: 1), range: nsRange)
                }

                self.resultLabel.attributedText = attributedString
                
                self.numberTextField.text = "\(value.drwNo)"
                self.dateLabel.text = "\(value.drwNoDate) 추첨"
                
                self.circle1.text = "\(value.drwtNo1)"
                self.designCircleColor(circle: self.circle1, num: value.drwtNo1)
                
                self.circle2.text = "\(value.drwtNo2)"
                self.designCircleColor(circle: self.circle2, num: value.drwtNo2)
                
                self.circle3.text = "\(value.drwtNo3)"
                self.designCircleColor(circle: self.circle3, num: value.drwtNo3)
                
                self.circle4.text = "\(value.drwtNo4)"
                self.designCircleColor(circle: self.circle4, num: value.drwtNo4)
                
                self.circle5.text = "\(value.drwtNo5)"
                self.designCircleColor(circle: self.circle5, num: value.drwtNo5)
                
                self.circle6.text = "\(value.drwtNo6)"
                self.designCircleColor(circle: self.circle6, num: value.drwtNo6)
                
                self.circle7.text = "\(value.bnusNo)"
                self.designCircleColor(circle: self.circle7, num: value.bnusNo)
                
            case .failure(let error):
                print(error)
                self.numberTextField.text = "올바른 값을 입력해주세요."
            }
        }
    }

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1100
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var temp: [String] = []
        
        for item in 1...1100 {
            temp.append(String(item))
        }
        
        return temp[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(#function)
        
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(row + 1)"
        
        callRequest(url: url)
        
    }
    
}

extension ViewController {
    
    func designCircle(circle: UILabel) {
        circle.textColor = .white
        circle.textAlignment = .center
        circle.layer.masksToBounds = true
        circle.layer.cornerRadius = circle1.frame.width / 2
    }
    
    func designCircleColor(circle: UILabel, num: Int) {
        
        if num <= 10 {
            circle.backgroundColor = #colorLiteral(red: 0.9916900992, green: 0.7964017987, blue: 0, alpha: 1)
        } else if num <= 20 {
            circle.backgroundColor = #colorLiteral(red: 0.4122719765, green: 0.7733359933, blue: 0.9466633201, alpha: 1)
        } else if num <= 30 {
            circle.backgroundColor = #colorLiteral(red: 1, green: 0.4407774508, blue: 0.445666194, alpha: 1)
        } else if num <= 40 {
            circle.backgroundColor = #colorLiteral(red: 0.6588235497, green: 0.6588235497, blue: 0.6588235497, alpha: 1)
        } else if num <= 50 {
            circle.backgroundColor = #colorLiteral(red: 0.3732299209, green: 0.9750122428, blue: 0, alpha: 1)
        }
        
    }
    
    
    
}

