//
//  CircleImageView.swift
//  Reminder Project
//
//  Created by 김성률 on 7/4/24.
//

import UIKit

class CircularImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupView() {
        clipsToBounds = true
        contentMode = .scaleAspectFit
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
    }
}
