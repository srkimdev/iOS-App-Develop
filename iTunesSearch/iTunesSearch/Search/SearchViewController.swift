//
//  SearchViewController.swift
//  iTunesSearch
//
//  Created by 김성률 on 8/8/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Kingfisher

final class SearchViewController: UIViewController {
    
    let searchBar = UISearchBar()
    let tableView = UITableView()
    
    let viewModel = SearchViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        searchBar.delegate = self
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        
        bind()
        
    }
    
    func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(44)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureUI() {
        navigationItem.title = "검색"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .white
        
        tableView.rowHeight = 100
    }
    
    func bind() {
        
        let input = SearchViewModel.Input(searchButtonTap: searchBar.rx.searchButtonClicked, searchText: searchBar.rx.text.orEmpty)
        let output = viewModel.transform(input: input)
        
        output.appList
            .bind(to: tableView.rx.items(cellIdentifier: SearchTableViewCell.identifier, cellType: SearchTableViewCell.self)) { (row, element, cell) in
                
                cell.appNameLabel.text = element.trackName
                
                let url = URL(string: element.artworkUrl512)
                cell.appIconImageView.kf.setImage(with: url)
                
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Apps.self)
            .subscribe(with: self) { owner, value in
                
                let vc = DetailViewController()
                vc.data = value
                owner.navigationController?.pushViewController(vc, animated: true)
                
            }
            .disposed(by: disposeBag)
        
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        searchBar.showsCancelButton = true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        searchBar.showsCancelButton = false
        searchBar.text = nil
    }
    
}
