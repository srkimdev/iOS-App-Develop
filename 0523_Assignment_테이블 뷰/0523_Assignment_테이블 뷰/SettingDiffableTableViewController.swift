//
//  SettingDiffableTableViewController.swift
//  0523_Assignment_테이블 뷰
//
//  Created by 김성률 on 7/19/24.
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
        
        var component: [Settings] {
            switch self {
            case .first:
                return [Settings(name: "공지사항"), Settings(name: "실험실"), Settings(name: "버전 정보")]
            case .second:
                return [Settings(name: "개인/보안"), Settings(name: "알림"), Settings(name: "채팅"), Settings(name: "멀티프로필")]
            case .third:
                return [Settings(name: "고객센터/도움말")]
            }
        }
    }

//    lazy var settingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
//    var dataSource: UICollectionViewDiffableDataSource<Section, Settings>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        configureHierarchy()
//        configureLayout()
        configureUI()
        
        configureDataSource()
        updateSnapshot()
    }
    
//    private func configureHierarchy() {
//        view.addSubview(settingCollectionView)
//    }
//    
//    private func configureLayout() {
//        settingCollectionView.snp.makeConstraints { make in
//            make.edges.equalTo(view.safeAreaLayoutGuide)
//        }
//    }
    
    private func configureUI() {
        view.backgroundColor = .white
    }

//    private func collectionViewLayout() -> UICollectionViewLayout {
//        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
//        configuration.backgroundColor = .white
//        configuration.showsSeparators = true
//        
//        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
//        return layout
//    }
    
    private func configureDataSource() {
//        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, Settings> { cell, indexPath, itemIdentifier in
//            var content = UIListContentConfiguration.valueCell()
//            content.text = itemIdentifier.name
//            cell.contentConfiguration = content
//        }
//        
//        dataSource = UICollectionViewDiffableDataSource(collectionView: settingCollectionView) {
//            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Settings) -> UICollectionViewCell? in
//            
//            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)
//            
//            return cell
//        }
    }
    
    private func updateSnapshot() {
//        var snapshot = NSDiffableDataSourceSnapshot<Section, Settings>()
//        Section.allCases.forEach { section in
//            print(section)
//            snapshot.appendSections([section])
//            snapshot.appendItems(section.component, toSection: section)
//        }
//        dataSource.apply(snapshot)
    }
}
