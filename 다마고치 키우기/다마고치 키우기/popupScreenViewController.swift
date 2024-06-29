//
//  popupScreenViewController.swift
//  다마고치 키우기
//
//  Created by 김성률 on 6/6/24.
//

import UIKit
import SnapKit

class popupScreenViewController: UIViewController {

    let infoBackground = UIView()
    
    let damagochiImage = UIImageView()
    let damagochiName = UILabel()
    
    let line = UIView()
    
    let infoLabel = UILabel()
    
    let cancelButton = UIButton()
    let startButton = UIButton()
    
    var totalData: [Damagochi]?
    var data: Damagochi
    var startButtonTitle = "시작하기"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startButton.setTitle(startButtonTitle, for: .normal)
    }
    
    init(totalData: [Damagochi]? = nil, data: Damagochi) {
        self.totalData = totalData
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        
        view.addSubview(infoBackground)
        view.addSubview(damagochiImage)
        view.addSubview(damagochiName)
        view.addSubview(line)
        view.addSubview(infoLabel)
        view.addSubview(cancelButton)
        view.addSubview(startButton)
    }
    
    func configureLayout() {
        
        infoBackground.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(140)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-150)
        }
        
        damagochiImage.snp.makeConstraints { make in
            make.top.equalTo(infoBackground.snp.top).offset(70)
            make.leading.equalTo(infoBackground.snp.leading).offset(96)
            make.trailing.equalTo(infoBackground.snp.trailing).offset(-96)
            make.height.equalTo(120)
        }
        
        damagochiName.snp.makeConstraints { make in
            make.top.equalTo(damagochiImage.snp.bottom).offset(8)
            make.leading.equalTo(infoBackground.snp.leading).offset(100)
            make.trailing.equalTo(infoBackground.snp.trailing).offset(-100)
            make.height.equalTo(30)
        }
        
        line.snp.makeConstraints { make in
            make.top.equalTo(damagochiName.snp.bottom).offset(30)
            make.leading.equalTo(infoBackground.snp.leading).offset(30)
            make.trailing.equalTo(infoBackground.snp.trailing).offset(-30)
            make.height.equalTo(1)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(30)
            make.leading.equalTo(infoBackground.snp.leading).offset(30)
            make.trailing.equalTo(infoBackground.snp.trailing).offset(-30)
            make.height.equalTo(100)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(30)
            make.leading.equalTo(infoBackground.snp.leading)
            make.bottom.equalTo(infoBackground.snp.bottom)
            make.trailing.equalTo(infoBackground.snp.centerX)
        }
        
        startButton.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(30)
            make.leading.equalTo(cancelButton.snp.trailing)
            make.trailing.equalTo(infoBackground.snp.trailing)
            make.bottom.equalTo(infoBackground.snp.bottom)
        }
    }
    
    func configureUI() {
    
        view.backgroundColor = .black.withAlphaComponent(0.5)
        UserDefaults.standard.set("대장", forKey: "nameChange")
        
        infoBackground.backgroundColor = #colorLiteral(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        damagochiImage.image = UIImage(named: data.image)
        
        damagochiName.text = data.name
        damagochiName.textAlignment = .center
        damagochiName.textColor = DamagochiColor.greenColor
        damagochiName.font = .systemFont(ofSize: 13)
        damagochiName.layer.borderWidth = 1
        damagochiName.layer.masksToBounds = true
        damagochiName.layer.cornerRadius = 5
        damagochiName.layer.borderColor = DamagochiColor.greenColor.cgColor
        
        line.backgroundColor = .gray
        
        infoLabel.backgroundColor = .clear
        infoLabel.text = "저는 방실방실 다마고치입니당 키는 100km\n몸무게는 150톤이에용\n성격은 화끈하고 날라다닙니당~!\n열심히 잘 먹고 잘 클 자신은\n있답니당 방실방실!"
        infoLabel.font = .systemFont(ofSize: 13)
        infoLabel.textColor = DamagochiColor.greenColor
        infoLabel.textAlignment = .center
        infoLabel.numberOfLines = 0
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(DamagochiColor.greenColor, for: .normal)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 15)
        cancelButton.backgroundColor = .clear
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = DamagochiColor.greenColor.cgColor
        
        startButton.setTitleColor(DamagochiColor.greenColor, for: .normal)
        startButton.titleLabel?.font = .systemFont(ofSize: 15)
        startButton.backgroundColor = .clear
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = DamagochiColor.greenColor.cgColor
        
    }
    
    @objc func cancelButtonClicked() {
        
        dismiss(animated: true)
        
    }
    
    @objc func startButtonClicked() {
        
        let vc = feedingViewController(data: data)

        UserDefaults.standard.set(true, forKey: "selected")
        UserDefaults.standard.set(data.name, forKey: "name")
        UserDefaults.standard.set(data.type, forKey: "type")
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .overFullScreen
        nav.modalTransitionStyle = .crossDissolve
        
        present(nav, animated: true)
        
    }
    
    
}
