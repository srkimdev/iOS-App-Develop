//
//  RegisterViewController.swift
//  Reminder Project
//
//  Created by 김성률 on 7/2/24.
//

import UIKit
import SnapKit
import RealmSwift

protocol RegisterViewControllerDelegate: AnyObject {
    func RegisterViewControllerDidDismiss()
}

class RegisterViewController: UIViewController {

    let backgroundScene = UIView()
    
    let titleTextField = UITextField()
    let line = UIView()
    let memoTextView = UITextView()
    
    let registerTableView = UITableView()
    var list = ["마감일", "태그", "우선순위", "이미지 추가"]
    var cellDate = ["", "", "", ""]
    var temp: Date?
    
    weak var delegate: RegisterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        
        memoTextView.delegate = self
        registerTableView.delegate = self
        registerTableView.dataSource = self
        registerTableView.register(RegisterOtherTableViewCell.self, forCellReuseIdentifier: RegisterOtherTableViewCell.identifier)
        
    }
    
    func configureHierarchy() {
        
        view.addSubview(backgroundScene)
        backgroundScene.addSubview(titleTextField)
        backgroundScene.addSubview(line)
        backgroundScene.addSubview(memoTextView)
        view.addSubview(registerTableView)
    }
    
    func configureLayout() {
        
        backgroundScene.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(160)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(backgroundScene.snp.top).offset(8)
            make.horizontalEdges.equalTo(backgroundScene).inset(12)
            make.height.equalTo(20)
        }
        
        line.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(backgroundScene).inset(12)
            make.height.equalTo(1)
        }
        
        memoTextView.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(backgroundScene).inset(8)
            make.bottom.equalTo(backgroundScene).inset(8)
        }
        
        registerTableView.snp.makeConstraints { make in
            make.top.equalTo(backgroundScene.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureUI() {
        
        view.backgroundColor = .systemGray5
        
        navigationItem.title = "새로운 할 일"
        
        let leftBarButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonClicked))
        navigationItem.leftBarButtonItem = leftBarButton
        
        let rightBarButton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(addButtonClicked))
        navigationItem.rightBarButtonItem = rightBarButton
        
        backgroundScene.layer.cornerRadius = 10
        backgroundScene.backgroundColor = .white
        
        titleTextField.placeholder = "제목"
        titleTextField.font = .systemFont(ofSize: 12)
        
        line.backgroundColor = .black
        
        memoTextView.text = "메모"
        memoTextView.textColor = .systemGray2
        
        registerTableView.backgroundColor = .systemGray5
    }
    
    @objc func cancelButtonClicked() {
        dismiss(animated: true)
    }
    
    @objc func addButtonClicked() {
        
        let realm = try! Realm()
        
        guard let title = titleTextField.text, !title.isEmpty else {
            showAlert()
            return
        }
        
        let data = DBTable(memoTitle: title, memoContents: memoTextView.text, enrollDate: temp, tag: cellDate[1], priority: cellDate[2])
        
        print(realm.configuration.fileURL)
        
        try! realm.write {
            realm.add(data)
        }
        
        delegate?.RegisterViewControllerDidDismiss()
        dismiss(animated: true)
    }
    
}

extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = registerTableView.dequeueReusableCell(withIdentifier: RegisterOtherTableViewCell.identifier, for: indexPath) as! RegisterOtherTableViewCell
        
        cell.designCell(transition1: list[indexPath.row], transition2: cellDate[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let vc = DateViewController()
            
            vc.selectedDate = { value in
                
                let format = DateFormatter()
                format.dateFormat = "yyyy. MM. dd E"
                format.locale = Locale(identifier:"ko_KR")
                
                self.cellDate[indexPath.row] = format.string(from: value)

                let calendar = Calendar.current
                let components = calendar.dateComponents([.year, .month, .day], from: value)

                if let year = components.year, let month = components.month, let day = components.day {
                    let dateOnly = calendar.date(from: DateComponents(year: year, month: month, day: day))
                    self.temp = dateOnly
                }
                
                self.registerTableView.reloadData()
            }
            
            navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.row == 1 {
            let vc = TagViewController()
            
            vc.inputText = { value in
                
                self.cellDate[indexPath.row] = value
                
                self.registerTableView.reloadData()
            }
            
            navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.row == 2 {
            let vc = PriorityViewController()
            
            vc.segmentTitle = { value in
                
                self.cellDate[indexPath.row] = value
                
                self.registerTableView.reloadData()
            }
            
            navigationController?.pushViewController(vc, animated: true)
            
        } else {
            let vc = PHPickerViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}

extension RegisterViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
            
        if textView == memoTextView {
            if textView.textColor == .systemGray2 {
                textView.text = nil
                textView.textColor = .black
            }
        }
    }
}

extension RegisterViewController {
    
    func showAlert() {
    
        let alert = UIAlertController(
            title: "제목을 입력해주세요",
            message: nil,
            preferredStyle: .alert)
        
        let open = UIAlertAction(title: "확인", style: .default)
        alert.addAction(open)
        
        present(alert, animated: true)
        
    }
    
}
