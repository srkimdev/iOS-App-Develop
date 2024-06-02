//
//  TravelTalkViewController.swift
//  0601_Assignment_트래블톡
//
//  Created by 김성률 on 6/1/24.
//

import UIKit

class TravelTalkViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    
    var filteredChatRooms: [ChatRoom] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.placeholder = "친구 이름을 검색해보세요"
        searchBar.searchBarStyle = .minimal
        
        configureTravelTalkViewController()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}

extension TravelTalkViewController {
    
    func configureTravelTalkViewController() {
        
        filteredChatRooms = mockChatList
        
        navigationItem.title = "TRAVEL TALK"
        navigationController?.navigationBar.shadowImage = nil
        
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        
        let xib = UINib(nibName: ChatListTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: ChatListTableViewCell.identifier)
        
    }
    
}

extension TravelTalkViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        var temp: [ChatRoom] = []
        
        guard let searchBarText = searchBar.text else { return }
        let input = searchBarText.lowercased()
        
        if input == "" {
            filteredChatRooms = mockChatList
        } else {
            for item in mockChatList {
                if input == item.chatroomName.lowercased() {
                    temp.append(item)
                }
            }
            filteredChatRooms = temp
        }

        tableView.reloadData()
    }
    
}

extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredChatRooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatListTableViewCell.identifier, for: indexPath) as! ChatListTableViewCell
        
        cell.configureChatroomTableViewCell(transition: filteredChatRooms[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChatroomViewController") as! ChatroomViewController
        
        vc.chat = filteredChatRooms[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
