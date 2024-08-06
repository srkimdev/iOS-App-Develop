//
//  BirthdayViewController.swift
//  0730_RxSwift
//
//  Created by 김성률 on 8/2/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class BirthdayViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let birthDayPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.locale = Locale(identifier: "ko-KR")
        picker.maximumDate = Date()
        return picker
    }()
    
    let infoLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.text = "만 17세 이상만 가입 가능합니다."
        return label
    }()
    
    let containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 10
        return stack
    }()
    
    let yearLabel: UILabel = {
       let label = UILabel()
        label.text = "2023년"
        label.textColor = .black
        label.snp.makeConstraints {
            $0.width.equalTo(100)
        }
        return label
    }()
    
    let monthLabel: UILabel = {
       let label = UILabel()
        label.text = "33월"
        label.textColor = .black
        label.snp.makeConstraints {
            $0.width.equalTo(100)
        }
        return label
    }()
    
    let dayLabel: UILabel = {
       let label = UILabel()
        label.text = "99일"
        label.textColor = .black
        label.snp.makeConstraints {
            $0.width.equalTo(100)
        }
        return label
    }()
  
    let viewModel = BirthdayViewModel()
    let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        configureLayout()
        
        bind()
    }
    
    func bind() {
        
        let input = BirthdayViewModel.Input(date: birthDayPicker.rx.date, tap: nextButton.rx.tap)
        let output = viewModel.transform(input: input)
        
        output.year
            .map { "\($0)년" }
            .bind(to: yearLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.month
            .map { "\($0)월" }
            .bind(to: monthLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.day
            .map { "\($0)일" }
            .bind(to: dayLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.validation
            .bind(with: self) { owner, value in
                if value {
                    owner.infoLabel.text = "가입 가능한 나이입니다."
                    owner.infoLabel.textColor = .blue
                    owner.nextButton.isEnabled = true
                } else {
                    owner.infoLabel.text = "만 17세 이상만 가입 가능합니다."
                    owner.infoLabel.textColor = .red
                    owner.nextButton.isEnabled = false
                }
            }
            .disposed(by: disposeBag)
        
        output.tap
            .bind(with: self) { owner, _ in
                owner.showAlert()
            }
            .disposed(by: disposeBag)
        
    }
    
    func configureLayout() {
        view.addSubview(infoLabel)
        view.addSubview(containerStackView)
        view.addSubview(birthDayPicker)
        view.addSubview(nextButton)
 
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(150)
            $0.centerX.equalToSuperview()
        }
        
        containerStackView.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        [yearLabel, monthLabel, dayLabel].forEach {
            containerStackView.addArrangedSubview($0)
        }
        
        birthDayPicker.snp.makeConstraints {
            $0.top.equalTo(containerStackView.snp.bottom)
            $0.centerX.equalToSuperview()
        }
   
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(birthDayPicker.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        nextButton.backgroundColor = .lightGray
    }
    
    func showAlert() {
        
        let alert = UIAlertController(
            title: "완료",
            message: nil,
            preferredStyle: .alert)

        let check = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(check)
        
        present(alert, animated: true)
    }

}

