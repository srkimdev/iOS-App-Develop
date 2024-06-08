//
//  feedingViewController.swift
//  다마고치 키우기
//
//  Created by 김성률 on 6/7/24.
//

import UIKit
import SnapKit

class feedingViewController: UIViewController {

    let line = UIView()
    
    let commentLabel = UILabel()
    let bubbleImage = UIImageView()
    let damagochiImage = UIImageView()
    let damagochiName = UILabel()
    
    let damagochiInfo = UILabel()
    let riceTextField = UITextField()
    let waterTextField = UITextField()
    
    let riceTextFieldLine = UIView()
    let waterTextFieldLine = UIView()
    
    let riceButton = UIButton()
    let waterButton = UIButton()
    
    var data: Damagochi
    
    let list = ["복습 아직 안하셨다구요? 지금 잠이 오세여? 대장님??", "좋은 하루 되세요", "오늘 11시간 했다. 질문받는다", "배고파요", "테이블뷰컨트롤러와 뷰컨트롤러는 어떤 차이가 있을까요?", "오늘 깃허브 푸쉬 하셨어요?", "점점 미쳐 가는구나~", "한국 싱가포르 7대0 오졌구요~", "Bonjour Je suis Francais", "여기에 이름 넣는거는 너무 귀찮아~~"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserDefaults.standard.set("대장", forKey: "nameChange")

        configureHierarchy()
        configureLayout()
        configureUI()
        
        riceButton.addTarget(self, action: #selector(riceButtonClicked), for: .touchUpInside)
        waterButton.addTarget(self, action: #selector(waterButtonClicked), for: .touchUpInside)
       
    }
    
    init(data: Damagochi) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = UserDefaults.standard.string(forKey: "nameChange")! + "님의 다마고치"
        randomComment()
    }
    
    func configureHierarchy() {
        
        view.addSubview(line)
        view.addSubview(bubbleImage)
        view.addSubview(commentLabel)
        view.addSubview(damagochiImage)
        view.addSubview(damagochiName)
        view.addSubview(damagochiInfo)
        view.addSubview(riceTextField)
        view.addSubview(riceTextFieldLine)
        view.addSubview(waterTextField)
        view.addSubview(waterTextFieldLine)
        view.addSubview(riceButton)
        view.addSubview(waterButton)
        
    }
    
    func configureLayout() {
        
        line.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(1)
        }
        
        bubbleImage.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(200)
            make.height.equalTo(130)
        }
        
        commentLabel.snp.makeConstraints { make in
            make.top.equalTo(bubbleImage.snp.top).offset(30)
            make.leading.equalTo(bubbleImage.snp.leading).offset(20)
            make.trailing.equalTo(bubbleImage.snp.trailing).offset(-20)
            make.bottom.equalTo(bubbleImage.snp.bottom).offset(-40)
        }
        
        damagochiImage.snp.makeConstraints { make in
            make.top.equalTo(bubbleImage.snp.bottom).offset(16)
            make.centerX.equalTo(self.view)
            make.width.equalTo(180)
            make.height.equalTo(180)
        }
        
        damagochiName.snp.makeConstraints { make in
            make.top.equalTo(damagochiImage.snp.bottom).offset(8)
            make.centerX.equalTo(self.view)
            make.width.equalTo(110)
            make.height.equalTo(30)
        }
        
        damagochiInfo.snp.makeConstraints { make in
            make.top.equalTo(damagochiName.snp.bottom).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-100)
            make.height.equalTo(28)
        }
        
        riceTextField.snp.makeConstraints { make in
            make.top.equalTo(damagochiInfo.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(85)
            make.width.equalTo(140)
            make.height.equalTo(32)
        }
        
        riceButton.snp.makeConstraints { make in
            make.top.equalTo(damagochiInfo.snp.bottom).offset(20)
            make.leading.equalTo(riceTextField.snp.trailing).offset(8)
            make.width.equalTo(66)
            make.height.equalTo(32)
        }
        
        riceTextFieldLine.snp.makeConstraints { make in
            make.top.equalTo(riceTextField.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(85)
            make.width.equalTo(140)
            make.height.equalTo(1)
        }
        
        waterTextField.snp.makeConstraints { make in
            make.top.equalTo(riceTextFieldLine.snp.bottom).offset(12)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(85)
            make.width.equalTo(140)
            make.height.equalTo(32)
        }
        
        waterButton.snp.makeConstraints { make in
            make.top.equalTo(riceTextFieldLine.snp.bottom).offset(12)
            make.leading.equalTo(waterTextField.snp.trailing).offset(8)
            make.width.equalTo(66)
            make.height.equalTo(32)
        }
        
        waterTextFieldLine.snp.makeConstraints { make in
            make.top.equalTo(waterTextField.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(85)
            make.width.equalTo(140)
            make.height.equalTo(1)
        }
        
    }
    
    func configureUI() {
    
        view.backgroundColor = #colorLiteral(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)]
        
        let item = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(userButtonClicked))
        item.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        navigationItem.rightBarButtonItem = item
        
        line.backgroundColor = .gray
        bubbleImage.image = UIImage(named: "bubble")
        
        commentLabel.font = .systemFont(ofSize: 13)
        commentLabel.textAlignment = .center
        commentLabel.numberOfLines = 0
        commentLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        damagochiName.text = data.name
        damagochiName.textAlignment = .center
        damagochiName.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        damagochiName.font = .systemFont(ofSize: 13)
        damagochiName.layer.cornerRadius = 5
        damagochiName.layer.masksToBounds = true
        damagochiName.layer.borderWidth = 1
        damagochiName.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        
        damagochiImage.image = UIImage(named: data.image)
        
        damagochiInfo.text = "LV\(data.level) · 밥알 \(data.rice)개 · 물방울 \(data.water)개"
        damagochiInfo.textAlignment = .center
        damagochiInfo.font = .systemFont(ofSize: 13)
        damagochiInfo.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)

        riceTextField.placeholder = "밥주세용"
        riceTextField.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        riceTextField.font = .systemFont(ofSize: 13)
        riceTextField.textAlignment = .center
        
        var image = UIImage(systemName: "drop.circle")
        riceButton.setImage(image, for: .normal)
        riceButton.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        riceButton.setTitleColor(.black, for: .normal)
        riceButton.setTitle(" 밥먹기", for: .normal)
        riceButton.titleLabel?.font = .systemFont(ofSize: 13)
        riceButton.layer.cornerRadius = 5
        riceButton.layer.borderWidth = 1
        riceButton.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        
        waterTextField.placeholder = "물주세용"
        waterTextField.textColor = .gray
        waterTextField.font = .systemFont(ofSize: 13)
        waterTextField.textAlignment = .center
        
        image = UIImage(systemName: "leaf.circle")
        waterButton.setImage(image, for: .normal)
        waterButton.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        waterButton.setTitleColor(.black, for: .normal)
        waterButton.setTitle(" 물먹기", for: .normal)
        waterButton.titleLabel?.font = .systemFont(ofSize: 13)
        waterButton.layer.cornerRadius = 5
        waterButton.layer.borderWidth = 1
        waterButton.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        
        waterTextFieldLine.backgroundColor = .gray
        riceTextFieldLine.backgroundColor = .gray
        
    }
    
    func updateDamagochiStatus() {
        damagochiInfo.text = "LV\(data.level) · 밥알 \(data.rice)개 · 물방울 \(data.water)개"
        damagochiImage.image = UIImage(named: data.image)
    }
    
    func randomComment() {
        
        let num: Int = .random(in: 0...9)
        
        commentLabel.text = list[num]
    }
    
    
    @objc func userButtonClicked() {
        
        let vc = SettingViewController()
        
        vc.data = data
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func riceButtonClicked() {
        
        if riceTextField.text == "" {
            data.rice += 1
        } else {
            
            if Int(riceTextField.text!)! < 100 {
                data.rice += Int(riceTextField.text!)!
            }
        }
        
        UserDefaults.standard.set(data.rice, forKey: "rice")
        updateDamagochiStatus()
        riceTextField.text = nil
        randomComment()
    }

    @objc func waterButtonClicked() {
        
        if waterTextField.text == "" {
            data.water += 1
        } else {
            if Int(waterTextField.text!)! < 50 {
                data.water += Int(waterTextField.text!)!
            }
        }
        
        UserDefaults.standard.set(data.water, forKey: "water")
        updateDamagochiStatus()
        waterTextField.text = nil
        randomComment()
        
    }

}
