//
//  ReusableProtocol.swift
//  0601_Assignment_트래블톡
//
//  Created by 김성률 on 6/3/24.
//

import UIKit

protocol ReusableProtocol {
    
    static var identifier: String { get }
    
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


