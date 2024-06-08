//
//  SettingViewController.swift
//  다마고치 키우기
//
//  Created by 김성률 on 6/7/24.
//

import UIKit
import SnapKit

class SettingViewController: UIViewController {

    let settingTableView = UITableView()
    var data: Damagochi?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
                
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        settingTableView.reloadData()
    }
    
    func configureHierarchy() {
        
        view.addSubview(settingTableView)
        
    }
    
    func configureLayout() {
        
        settingTableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func configureUI() {
        
        view.backgroundColor = #colorLiteral(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        navigationItem.title = "설정"
        settingTableView.rowHeight = 50
        settingTableView.backgroundColor = .clear
        
        let item = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonClicked))
        item.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        navigationItem.leftBarButtonItem = item
        
    }
    
    @objc func backButtonClicked() {
        
        navigationController?.popViewController(animated: true)
        
    }

}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = settingTableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        
        cell.designCell(transition: SettingList().settingList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let vc = nameChangeViewController()
            navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.row == 1 {
            
            let vc = MainViewController()
            vc.navigationTitle = "변경하기"
            navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.row == 2 {
            
            let alert = UIAlertController(
                title: "데이터 초기화",
                message: "정말 다시 처음부터 시작하실 건가용?",
                preferredStyle: .alert)
            
            let yes = UIAlertAction(title: "웅", style: .default) { _ in
                
                UserDefaults.standard.removeObject(forKey: "rice")
                UserDefaults.standard.removeObject(forKey: "water")
                UserDefaults.standard.removeObject(forKey: "nameChange")
                
                let vc = MainViewController()
                let nav = UINavigationController(rootViewController: vc)
                
                nav.modalPresentationStyle = .overFullScreen
                nav.modalTransitionStyle = .crossDissolve
                
                self.present(nav, animated: true)
                
            }
            
            let cancel = UIAlertAction(title: "아니!", style: .cancel)
            
            alert.addAction(yes)
            alert.addAction(cancel)
            
            present(alert, animated: true)
            
        }
    
    }
    
//    func navigateToFirstScreen() {
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        
//        let mainViewController = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
//
//        if let window = UIApplication.shared.windows.first {
//            window.rootViewController = mainViewController
//            window.makeKeyAndVisible()
//            
//            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
//        }
//    }
    
}
