//
//  SettingTableViewController.swift
//  0523_Assignment_테이블 뷰
//
//  Created by 김성률 on 5/23/24.
//

import UIKit
import SnapKit

struct Settings: Hashable, Identifiable {
    let id = UUID()
    let name: String
}

final class SettingTableViewController: UIViewController {

    enum Section: Int, CaseIterable {
        case first
        case second
        case third
        
        var component: Settings {
            switch self {
            case .first:
                return
            case .second:
                return
            case .third:
                return
            }
        }
        

    }
    
    let list = [
        Fruit(name: "사과", count: 10, price: 3000),
        Fruit(name: "사과", count: 10, price: 3000),
        Fruit(name: "샤머", count: 20, price: 14000),
        Fruit(name: "애망", count: 2, price: 9000),
        Fruit(name: "바나나", count: 400, price: 1000)
    ]
    
    lazy var settingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Settings>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        configureDataSource()
//        updateSnapshot()
    }
    
    private func configureHierarchy() {
        view.addSubview(settingCollectionView)
    }
    
    private func configureLayout() {
        settingCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .white
    }

    private func collectionViewLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .white
        configuration.showsSeparators = true
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    private func configureDataSource() {
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, Settings> { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Settings>(collectionView: settingCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)
        }
    }
    
//    private func updateSnapshot() {
//        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
//        Section.allCases.forEach { section in
//            snapshot.appendSections([section])
//            snapshot.appendItems(section.setting, toSection: section)
//        }
//        dataSource.apply(snapshot)
//    }
}
    
    
    
    
    
    
    
    
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
//        if section == 0 {
//            return "전체 설정"
//        } else if section == 1 {
//            return "개인 설정"
//        } else if section == 2 {
//            return "기타"
//        } else {
//            return "섹션"
//        }
//        
//        
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return settings[0].count
//        } else if section == 1 {
//            return settings[1].count
//        } else if section == 2 {
//            return settings[2].count
//        } else {
//            return 0
//        }
//    }
//    
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "setting")!
//        
//        cell.textLabel?.text = settings[indexPath.section][indexPath.row]
//        
//        cell.textLabel?.font = .boldSystemFont(ofSize: 12)
//        
//        return cell
//    }
//    


