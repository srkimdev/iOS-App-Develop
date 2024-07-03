//
//  DateViewController.swift
//  Reminder Project
//
//  Created by 김성률 on 7/3/24.
//

import UIKit
import SnapKit

class DateViewController: UIViewController {

    let datePicker = UIDatePicker()
    
    var selectedDate: ((Date) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        
        datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        
    }
    
    func configureHierarchy() {
        view.addSubview(datePicker)
    }
    
    func configureLayout() {
        datePicker.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        datePicker.preferredDatePickerStyle = .inline
    }
    
    @objc func dateSelected(_ sender: UIDatePicker) {
        selectedDate?(sender.date)
    }

}
