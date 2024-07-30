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
    
    let simpleTableView = UITableView()
    let simpleLabel = UILabel()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        setTableView()
    }
    
    func configureHierarchy() {
        view.addSubview(simpleTableView)
        view.addSubview(simpleLabel)
    }
    
    func configureLayout() {
        simpleTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
        }
        
        simpleLabel.snp.makeConstraints { make in
            make.top.equalTo(simpleTableView.snp.bottom).offset(100)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(50)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        simpleLabel.backgroundColor = .lightGray
        simpleLabel.textAlignment = .center
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
//                self.showAlert
            }
            .disposed(by: disposeBag)
    }
}
