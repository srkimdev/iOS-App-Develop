//
//  DataBase.swift
//  Reminder Project
//
//  Created by 김성률 on 7/2/24.
//

import Foundation
import RealmSwift

class DBTable: Object {
    
//    @Persisted(primaryKey: true) var id: ObjectId
//    @Persisted(indexed: true) var memoTitle: String // -> 적당한 선에서 인덱스를 설정해야된다.
    
    @Persisted var memoTitle: String
    @Persisted var memoContents: String?
    @Persisted var enrollDate: Date?
    @Persisted var tag: String
    @Persisted var priority: String
    @Persisted var flag: Bool
    @Persisted var complete: Bool
    
    convenience init(memoTitle: String, memoContents: String?, enrollDate: Date?, tag: String, priority: String) {
        self.init()
        self.memoTitle = memoTitle
        self.memoContents = memoContents
        self.enrollDate = enrollDate
        self.tag = tag
        self.priority = priority
        self.flag = false
        self.complete = false
    }
}

