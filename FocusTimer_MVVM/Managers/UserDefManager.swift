//
//  UserDefManager.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 27.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class UserDefManager {
    
    static let shared = UserDefManager()
    
    private let defaults = UserDefaults.standard

    
    // MARK: String
    
    func saveStringValue(value: String, key: String) {
        
        defaults.set(value, forKey: key)        
    }
    
    func readStringValue(for key: String) -> String {
        
        if let stringValue = defaults.value(forKey: key) as? String {
            return stringValue
        } else {
            return ""
        }
    }
    
    // MARK: - Int

    func saveIntValue(value: Int, key: String) {
        
        defaults.set(value, forKey: key)
    }
    
    func readIntValue(key: String) -> Int {
        
        if let interval = defaults.value(forKey: key) as? Int {
            return interval
        } else {
            return 0
        }
    }
    
    // MARK: - Bool

    func saveBoolValue(value: Bool, key: String) {
        
        defaults.set(value, forKey: key)
    }
    
    func readBoolValue(key: String) -> Bool {
        
        if let interval = defaults.value(forKey: key) as? Bool {
            return interval
        } else {
            return true
        }
    }
}
