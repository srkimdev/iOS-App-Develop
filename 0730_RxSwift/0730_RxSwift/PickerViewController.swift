//
//  PickerViewController.swift
//  0730_RxSwift
//
//  Created by 김성률 on 7/30/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class PickerViewController: UIViewController {
    
    let simpleLabel = UILabel()
    let simplePickerView = UIPickerView()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        setPickerView()
    }
    
    func configureHierarchy() {
        view.addSubview(simplePickerView)
        view.addSubview(simpleLabel)
    }
    
    func configureLayout() {
        simplePickerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(100)
        }
        
        simpleLabel.snp.makeConstraints { make in
            make.top.equalTo(simplePickerView.snp.bottom).offset(100)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.height.equalTo(50)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        simpleLabel.backgroundColor = .lightGray
        simpleLabel.textAlignment = .center
    }
    
    func setPickerView() {
        let items = Observable.just([
            "영화",
            "애니메이션",
            "드라마",
            "기타"
        ])
        
        items
            .bind(to: simplePickerView.rx.itemTitles) { (row, element) in
                return element
            }
            .disposed(by: disposeBag)
        
        simplePickerView.rx.modelSelected(String.self)
            .map { $0.description }
            .bind(to: simpleLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
}
