//
//  SettingTableViewController.swift
//  0523_Assignment_테이블 뷰
//
//  Created by 김성률 on 5/23/24.
//

import UIKit

class SettingTableViewController: UITableViewController {

    var settings = [["공지사항", "실험실", "버전 정보"], ["개인/보안", "알림", "채팅", "멀티프로필"], ["고객센터/도움말"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "전체 설정"
        } else if section == 1 {
            return "개인 설정"
        } else if section == 2 {
            return "기타"
        } else {
            return "섹션"
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return settings[0].count
        } else if section == 1 {
            return settings[1].count
        } else if section == 2 {
            return settings[2].count
        } else {
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setting")!
        
        cell.textLabel?.text = settings[indexPath.section][indexPath.row]
        
        cell.textLabel?.font = .boldSystemFont(ofSize: 12)
        
        return cell
    }
    
    
    
}
