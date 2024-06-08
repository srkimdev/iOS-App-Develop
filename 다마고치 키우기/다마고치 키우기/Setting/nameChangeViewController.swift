//
//  nameChangeViewController.swift
//  다마고치 키우기
//
//  Created by 김성률 on 6/7/24.
//

import UIKit
import SnapKit

class nameChangeViewController: UIViewController {

    let naviLine = UIView()
    let inputTextField = UITextField()
    let line = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    func configureHierarchy() {
        
        view.addSubview(naviLine)
        view.addSubview(inputTextField)
        view.addSubview(line)
        
    }
    
    func configureLayout() {
        
        naviLine.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(1)
        }
        
        inputTextField.snp.makeConstraints { make in
            make.top.equalTo(naviLine.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(30)
        }
        
        line.snp.makeConstraints { make in
            make.top.equalTo(inputTextField.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(1)
        }
        
    }
    
    func configureUI() {
        
        view.backgroundColor = #colorLiteral(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        navigationItem.title = UserDefaults.standard.string(forKey: "nameChange")! + "님 이름 정하기"
        
        let item = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
        navigationItem.rightBarButtonItem = item
        
        naviLine.backgroundColor = .systemGray5
        inputTextField.font = .systemFont(ofSize: 13)
        line.backgroundColor = .gray
        
    }
    
    @objc func saveButtonClicked() {
        
        guard let text = inputTextField.text else { return }
        
        if text.count >= 2 && text.count <= 6 {
            UserDefaults.standard.set(text, forKey: "nameChange")
        }
    }

}
