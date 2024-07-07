//
//  RealmRepository.swift
//  Reminder Project
//
//  Created by 김성률 on 7/7/24.
//

import UIKit
import RealmSwift
import FSCalendar

final class RealmRepository {
    
    private let realm = try! Realm()
    var standard: Int?
    
    func createItem(_ data: DBTable) {
        
        do {
            try! realm.write {
                realm.add(data)
                print("Realm Create Succeed")
            }
        } catch {
            print("Realm Error")
        }
        
    }
    
    func readAllItem() -> Results<DBTable> {
        return realm.objects(DBTable.self).sorted(byKeyPath: "price", ascending: false)
    }
    
    func deleteItem(_ data: DBTable) {
        try! realm.write {
            realm.delete(data)
        }
    }
    
    func readItems(standard: Int?) -> Results<DBTable> {
        
        switch standard {
        case 0:
            return realm.objects(DBTable.self).where{ $0.enrollDate == currentDate() }
        case 1:
            return realm.objects(DBTable.self).where{ $0.enrollDate > currentDate() }
        case 2:
            return realm.objects(DBTable.self)
        case 3:
            return realm.objects(DBTable.self).where{ $0.flag == true }
        case 4:
            return realm.objects(DBTable.self).where{ $0.complete == true }
        default:
            return realm.objects(DBTable.self)
        }
    }
    
    func currentDate() -> Date {
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: Date())

        if let year = components.year, let month = components.month, let day = components.day {
            return calendar.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
        }
        
        return Date()
    }
    
}
