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

extension UICollectionViewCell: ReusableProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: ReusableProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: ReusableProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
