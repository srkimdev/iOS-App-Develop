//
//  MovieTableViewCell.swift
//  0605_Assignment_movieAPI
//
//  Created by 김성률 on 6/5/24.
//

import UIKit
import SnapKit

class MovieTableViewCell: UITableViewCell {

    static let identifier = "MovieTableViewCell"
    
    let numberLabel = UILabel()
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        
        contentView.addSubview(numberLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        
    }
    
    func configureLayout() {
        
        numberLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.leading.equalTo(contentView.snp.leading)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
            make.width.equalTo(42)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.leading.equalTo(numberLabel.snp.trailing).offset(16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
            make.width.equalTo(190)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.trailing.equalTo(contentView.snp.trailing)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
            make.width.equalTo(90)
        }

        
    }
    
    func configureUI() {
        
        numberLabel.textAlignment = .center
        numberLabel.backgroundColor = .white
        
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.textColor = .white
        titleLabel.backgroundColor = .clear
        
        dateLabel.textColor = .white
        dateLabel.font = .boldSystemFont(ofSize: 14)
        dateLabel.textAlignment = .right
        dateLabel.backgroundColor = .clear
        
    }
    
    func configureContent(transition: DailyBoxOfficeList) {
        
        print(transition)
        numberLabel.text = transition.rank
        titleLabel.text = transition.movieNm
        dateLabel.text = transition.openDt
        
    }

}

