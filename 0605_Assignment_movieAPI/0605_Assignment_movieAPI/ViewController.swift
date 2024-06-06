//
//  ViewController.swift
//  0605_Assignment_movieAPI
//
//  Created by 김성률 on 6/5/24.
//

import UIKit
import SnapKit
import Alamofire

struct Movie {
    
    let rank: String
    let movieNm: String
    let openDate: String
    
}


class ViewController: UIViewController {

    let backgroundImage = UIImageView()
    let line = UIView()
    let movieTableView = UITableView()
    let dateTextField = UITextField()
    let searchButton = UIButton()
    
    var list: [DailyBoxOfficeList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView.rowHeight = 40
        movieTableView.backgroundColor = .clear
        movieTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        callRequest(date: "20120101")
        
        searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        
    }

    func configureHierarchy() {
        
        view.addSubview(backgroundImage)
        view.addSubview(line)
        view.addSubview(dateTextField)
        view.addSubview(searchButton)
        view.addSubview(movieTableView)
        
    }
    
    func configureLayout() {
        
        backgroundImage.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(45)
            make.width.equalTo(250)
        }
        
        line.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.width.equalTo(250)
            make.height.equalTo(5)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(dateTextField.snp.trailing).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(50)
        }
        
        movieTableView.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func configureUI() {
        
        backgroundImage.image = UIImage(named: "어벤져스엔드게임")
        backgroundImage.alpha = 0.9
            
        line.backgroundColor = .white
        dateTextField.textColor = .white
        
        searchButton.setTitle("검색", for: .normal)
        searchButton.setTitleColor(.black, for: .normal)
        searchButton.backgroundColor = .white
        
    }
    
    @objc func searchButtonClicked() {
        
        guard let text = dateTextField.text else { return }
        
        callRequest(date: text)
        
        movieTableView.reloadData()

    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = movieTableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        
        cell.configureContent(transition: list[indexPath.row])
        
        return cell
    }
    
}

extension ViewController {
    
    func callRequest(date: String) {
        
        let url = APIKey.movieAPIKey + date
        
        AF.request(url).responseDecodable(of: Welcome.self) { response in
            switch response.result {
            case .success(let value):
                let dailyBoxOfficeList = value.boxOfficeResult.dailyBoxOfficeList
                
                self.list = dailyBoxOfficeList
                self.movieTableView.reloadData()

            case .failure(let error):
                print("실패")
            }
        }

    }
    
}

