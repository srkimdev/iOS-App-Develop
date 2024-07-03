//
//  DataBase.swift
//  Reminder Project
//
//  Created by 김성률 on 7/2/24.
//

import Foundation
import RealmSwift

class Table: Object {
    
//    @Persisted(primaryKey: true) var id: ObjectId
//    @Persisted(indexed: true) var memoTitle: String // -> 적당한 선에서 인덱스를 설정해야된다.
    
    @Persisted var memoTitle: String
    @Persisted var memoContents: String?
    @Persisted var enrollDate: String?
    @Persisted var tag: String
    @Persisted var priority: String
    
    convenience init(memoTitle: String, memoContents: String?, enrollDate: String?, tag: String, priority: String) {
        self.init()
        self.memoTitle = memoTitle
        self.memoContents = memoContents
        self.enrollDate = enrollDate
        self.tag = tag
        self.priority = priority
    }
}

