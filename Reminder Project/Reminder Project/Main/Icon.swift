//
//  Icon.swift
//  Reminder Project
//
//  Created by 김성률 on 7/4/24.
//

import UIKit

enum Icon: String, CaseIterable {
    
    case today = "오늘"
    case scheduled = "예정"
    case total = "전체"
    case flag = "깃발 표시"
    case complete = "완료됨"
    
    var systemImageName: UIImage{
        
        switch self {
        case .today:
            return UIImage(systemName: "calendar.badge.plus")!
        case .scheduled:
            return UIImage(systemName: "calendar")!
        case .total:
            return UIImage(systemName: "tray.fill")!
        case .flag:
            return UIImage(systemName: "flag")!
        case .complete:
            return UIImage(systemName: "checkmark")!
        }
    }
    
    var iconColor: UIColor {
        
        switch self {
        case .today:
            return UIColor.blue
        case .scheduled:
            return UIColor.red
        case .total:
            return UIColor.gray
        case .flag:
            return UIColor.orange
        case .complete:
            return UIColor.gray
        }
    }
    
}
