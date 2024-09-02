//
//  SimpleTableViewController.swift
//  0719_DiffableDataSource+ListConfiguration
//
//  Created by 김성률 on 8/29/24.
//

import UIKit
import SnapKit

struct Fruit: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let count: Int
    let price: Int
}

final class SimpleCollectionViewController: UIViewController {
    
    let list = [
        Fruit(name: "사과", count: 10, price: 3000),
        Fruit(name: "사과", count: 10, price: 3000),
        Fruit(name: "샤머", count: 20, price: 14000),
        Fruit(name: "애망", count: 2, price: 9000),
        Fruit(name: "바나나", count: 400, price: 1000)
    ]
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    var dataSource: UICollectionViewDiffableDataSource<String, Fruit>!
    
    func collectionViewLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .systemGreen
        configuration.showsSeparators = false
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        configureDataSource()
        updateSnapshot()
        
    }
    
    private func configureDataSource() {
        
        var registration: UICollectionView.CellRegistration<UICollectionViewListCell, Fruit>!
        
        registration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            content.secondaryText = itemIdentifier.price.formatted() + "원"
            content.textProperties.color = .brown
            content.textProperties.font = .boldSystemFont(ofSize: 20)
            content.image = UIImage(systemName: "star.fill")
            content.imageProperties.tintColor = .red
            
            cell.contentConfiguration = content
            
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)
            
            return cell
        })
        
    }
    
    func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<String, Fruit>()
        
        snapshot.appendSections(["a", "b"])
        snapshot.appendItems(list, toSection: "a")
        
        dataSource.apply(snapshot)
    }
    
    
}
