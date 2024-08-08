//
//  DetailViewController.swift
//  iTunesSearch
//
//  Created by 김성률 on 8/8/24.
//

import UIKit
import SnapKit
import Kingfisher

final class DetailViewController: UIViewController {
    
    let appIcon = UIImageView()
    let appName = UILabel()
    let downloadButton = UIButton()
    
    var data: Apps?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        guard let data else { return }
        designViewCon(transition: data)
        
    }
    
    func configureHierarchy() {
        view.addSubview(appIcon)
        view.addSubview(appName)
        view.addSubview(downloadButton)
    }
    
    func configureLayout() {
        appIcon.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.size.equalTo(80)
        }
        
        appName.snp.makeConstraints { make in
            make.top.equalTo(appIcon.snp.top).offset(8)
            make.leading.equalTo(appIcon.snp.trailing).offset(12)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(4)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.bottom.equalTo(appIcon.snp.bottom).inset(4)
            make.leading.equalTo(appIcon.snp.trailing).offset(12)
            make.width.equalTo(60)
            make.height.equalTo(24)
        }
        
    }
    
    func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.setNavigationBarHidden(false, animated: false)
        view.backgroundColor = .white
        
        appName.font = .systemFont(ofSize: 15, weight: .bold)
        
        downloadButton.setTitle("받기", for: .normal)
        downloadButton.setTitleColor(.white, for: .normal)
        downloadButton.isUserInteractionEnabled = true
        downloadButton.backgroundColor = .blue
        downloadButton.layer.cornerRadius = 12
        
    }
    
    func designViewCon(transition: Apps) {
        
        let url = URL(string: transition.artworkUrl512)
        appIcon.kf.setImage(with: url)
        
        appName.text = transition.trackName
        
    }
    
}
