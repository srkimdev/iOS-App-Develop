//
//  PropertyWrapper.swift
//  SwiftUIBasic
//
//  Created by 김성률 on 9/2/24.
//

import SwiftUI

@propertyWrapper
struct SetDefaults<T> {
    
    let key: String
    let defaultValue: T
    
    var wrappedValue: T {
        get {
            UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
    
}

enum UserDefaultsManager {
    
    enum Key: String {
        case email
    }
    
    @SetDefaults(key: Key.email.rawValue, defaultValue: "email doesn't exist")
    static var email
    
}
