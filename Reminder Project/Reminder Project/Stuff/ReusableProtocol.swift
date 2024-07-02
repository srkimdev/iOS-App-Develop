//
//  ReusableProtocol.swift
//  Reminder Project
//
//  Created by 김성률 on 7/2/24.
//

import UIKit

protocol ReusableProtocol {
    static var identifier: String { get }
}

extension NSObjectProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
