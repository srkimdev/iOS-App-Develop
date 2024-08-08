//
//  SearchViewController.swift
//  iTunesSearch
//
//  Created by 김성률 on 8/8/24.
//

import UIKit
import SnapKit
import RxSwift

final class SearchViewController: UIViewController {
    
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        searchBar.delegate = self
        
        bind()
        
    }
    
    func configureHierarchy() {
        view.addSubview(searchBar)
    }
    
    func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(44)
        }
    }
    
    func configureUI() {
        navigationItem.title = "검색"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .white
    }
    
    func bind() {
        
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
