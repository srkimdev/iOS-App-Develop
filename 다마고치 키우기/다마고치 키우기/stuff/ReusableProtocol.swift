//
//  ReusableProtocol.swift
//  다마고치 키우기
//
//  Created by 김성률 on 6/6/24.
//

import UIKit

protocol ReusableProtocol {
    
    static var identifier: String { get }
    
}

protocol CustomCellDelegate: AnyObject {
    func didImageButton(in cell: mainTableViewCell)
}

extension UICollectionViewCell: ReusableProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

extension UIViewController: ReusableProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
