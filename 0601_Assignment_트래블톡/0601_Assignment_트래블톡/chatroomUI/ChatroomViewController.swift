//
//  ChatroomViewController.swift
//  0601_Assignment_트래블톡
//
//  Created by 김성률 on 6/1/24.
//

import UIKit

class ChatroomViewController: UIViewController {

    var chat: ChatRoom?
    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var chatTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let chat = chat else { return }
        configureChatroomViewController(transition: chat)
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
    }
    


}

extension ChatroomViewController {
    
    func configureChatroomViewController(transition: ChatRoom) {
        
        navigationItem.title = transition.chatroomName
        
        let backButtonImage = UIImage(systemName: "chevron.backward")
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonClicked))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        
        chatTableView.separatorStyle = .none
        chatTableView.rowHeight = UITableView.automaticDimension
        
        let userXib = UINib(nibName: "UserTableViewCell", bundle: nil)
        chatTableView.register(userXib, forCellReuseIdentifier: "UserTableViewCell")
        
        let otherXib = UINib(nibName: "otherTableViewCell", bundle: nil)
        chatTableView.register(otherXib, forCellReuseIdentifier: "otherTableViewCell")
        
    }
    
    @objc func backButtonClicked() {
            navigationController?.popViewController(animated: true)
        }
    
}

extension ChatroomViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chat!.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if chat?.chatList[indexPath.row].user == .user {
            
            let cell = chatTableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
            
            cell.configureUserTableViewCell(transition: chat!, index: indexPath.row)
            
            return cell
            
        } else {
            
            let cell = chatTableView.dequeueReusableCell(withIdentifier: "otherTableViewCell") as! otherTableViewCell
            
            cell.configureOtherTableViewCell(transition: chat!, index: indexPath.row)
            
            return cell
        }
        
    }
    

}
