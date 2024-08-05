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

    let viewModel = PhoneViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureLayout()
        
        bind()
        
    }
    
    func bind() {
        
        let input = PhoneViewModel.Input(text: phoneTextField.rx.text, tap: nextButton.rx.tap)
        let output = viewModel.transform(input: input)
        
        output.validText
            .bind(to: phoneTextField.rx.text)
            .disposed(by: disposeBag)
        
        output.validText
            .bind(to: descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.validation
            .bind(with: self) { owner, value in
                owner.descriptionLabel.text = value ? "사용 가능한 전화번호 입니다." : "조건에 맞지 않습니다."
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
        
        nextButton.backgroundColor = .lightGray
    }

}

