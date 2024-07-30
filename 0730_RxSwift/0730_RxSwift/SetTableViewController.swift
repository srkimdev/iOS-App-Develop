//
//  SetTableViewController.swift
//  0730_RxSwift
//
//  Created by 김성률 on 7/30/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class SetTableViewController: UIViewController {
    
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
    
    func setTableView() {
        simpleTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        let items = Observable.just([
            "First Item",
            "Second Item",
            "Third Item"
        ])
        
        items
            .bind(to: simpleTableView.rx.items) { (tableView, row, element) in
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
                cell.textLabel?.text = "\(element) @ row \(row)"
                return cell
            }
            .disposed(by: disposeBag)
        
        simpleTableView.rx.modelSelected(String.self)
            .map { data in
                "\(data)를 클릭했습니다."
            }
            .bind(to: simpleLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
}
