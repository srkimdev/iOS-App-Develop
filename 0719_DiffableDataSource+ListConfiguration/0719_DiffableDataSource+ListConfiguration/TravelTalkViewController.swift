//
//  TravelTalkViewController.swift
//  0719_DiffableDataSource+ListConfiguration
//
//  Created by 김성률 on 7/21/24.
//

import UIKit
import SnapKit

enum Section: CaseIterable {
    case main
}

final class TravelTalkViewController: UIViewController {

    lazy var talkCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    var dataSource: UICollectionViewDiffableDataSource<Section, ChatRoom>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        configureDataSource()
        updateSnapshot()
    }
    
    private func configureHierarchy() {
        view.addSubview(talkCollectionView)
    }

    private func configureLayout() {
        talkCollectionView.snp.makeConstraints { make in
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
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, ChatRoom> { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.chatroomName
            content.image = UIImage(named: itemIdentifier.chatroomImage)
            content.imageProperties.maximumSize = CGSize(width: 45, height: 45)
            content.secondaryText = itemIdentifier.chatroomText
            
            cell.contentConfiguration = content
        }

        dataSource = UICollectionViewDiffableDataSource(collectionView: talkCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)

            return cell
        })
    }
    
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ChatRoom>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(mockChatList, toSection: .main)
        
        dataSource.apply(snapshot)
    }
}
