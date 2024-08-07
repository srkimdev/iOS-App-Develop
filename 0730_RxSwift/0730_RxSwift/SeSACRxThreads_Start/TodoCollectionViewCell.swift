//
//  TodoCollectionViewCell.swift
//  0730_RxSwift
//
//  Created by 김성률 on 8/7/24.
//

import UIKit
import SnapKit

final class TodoCollectionViewCell: UICollectionViewCell {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(label)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        
        label.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
