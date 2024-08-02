//
//  PhoneViewController.swift
//  0730_RxSwift
//
//  Created by 김성률 on 8/2/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class PhoneViewController: UIViewController {
   
    let phoneTextField = UITextField()
    let descriptionLabel = UILabel()
    let nextButton = UIButton()
    
    let validText = BehaviorSubject(value: "010")
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureLayout()
        
        bind()
        
    }
    
    func bind() {
        
        validText
            .bind(to: descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
        let validation = phoneTextField
            .rx
            .text
            .orEmpty
            .map { text in
                text.count >= 10 && text.allSatisfy({ $0.isNumber })
            }
        
        validation
            .bind(with: self) { owner, value in
                if value {
                    owner.descriptionLabel.text = "사용 가능한 전화번호 입니다."
                } else {
                    owner.descriptionLabel.text = "조건에 맞지 않습니다."
                }
            }
        
        
    }
    
    func configureLayout() {
        view.addSubview(phoneTextField)
        view.addSubview(descriptionLabel)
        view.addSubview(nextButton)
         
        phoneTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.top.equalTo(phoneTextField.snp.bottom)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(phoneTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        phoneTextField.backgroundColor = .lightGray
        phoneTextField.text = "010"
        
        nextButton.backgroundColor = .lightGray
    }

}

