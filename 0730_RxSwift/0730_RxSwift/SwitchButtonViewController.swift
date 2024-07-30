//
//  SwitchButtonViewController.swift
//  0730_RxSwift
//
//  Created by 김성률 on 7/30/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class SwitchButtonViewController: UIViewController {
    
    let simpleSwitch = UISwitch()
    
    let signName = UITextField()
    let signEmail = UITextField()
    let simpleLabel = UILabel()
    let signButton = UIButton()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        setSwitch()
        setSign()
    }
    
    func configureHierarchy() {
        view.addSubview(simpleSwitch)
        view.addSubview(signName)
        view.addSubview(signEmail)
        view.addSubview(simpleLabel)
        view.addSubview(signButton)
    }
    
    func configureLayout() {
        simpleSwitch.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(30)
        }
        
        signName.snp.makeConstraints { make in
            make.top.equalTo(simpleSwitch.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(50)
        }
        
        signEmail.snp.makeConstraints { make in
            make.top.equalTo(signName.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(50)
        }
        
        simpleLabel.snp.makeConstraints { make in
            make.top.equalTo(signEmail.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(50)
        }
        
        signButton.snp.makeConstraints { make in
            make.top.equalTo(simpleLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(50)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        signName.backgroundColor = .lightGray
        
        signEmail.backgroundColor = .lightGray
        
        simpleLabel.backgroundColor = .lightGray
        simpleLabel.textAlignment = .center
        
        signButton.backgroundColor = .cyan
        
    }
    
    func setSwitch() {
        Observable.of(false)
            .bind(to: simpleSwitch.rx.isOn)
            .disposed(by: disposeBag)
    }
    
    func setSign() {
        Observable.combineLatest(signName.rx.text.orEmpty, signEmail.rx.text.orEmpty) { value1, value2 in
            return "name은 \(value1)이고, 이메일 \(value2)입니다"
        }
        .bind(to: simpleLabel.rx.text)
        .disposed(by: disposeBag)
        
        signName.rx.text.orEmpty
            .map { $0.count < 4}
            .bind(to: signEmail.rx.isHidden, signButton.rx.isHidden)
            .disposed(by: disposeBag)
        
        signEmail.rx.text.orEmpty
            .map { $0.count < 4 }
            .bind(to: signButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        signButton.rx.tap
            .subscribe { _ in
                self.showAlert()
            }
            .disposed(by: disposeBag)
    }
    
    func showAlert() {
        
        let alert = UIAlertController(
            title: "Got it",
            message: nil,
            preferredStyle: .alert)
            
        let check = UIAlertAction(title: "확인", style: .default)

        alert.addAction(check)
            
        present(alert, animated: true)
    }
}
