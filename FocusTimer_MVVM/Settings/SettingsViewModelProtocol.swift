//
//  SettingsViewModelProtocol.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 28.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

protocol SettingsViewModelProtocol {
    
    func saveIntValue(value: Int, type: String)
    func readIntValue(key: String) -> Int
    func saveColorScheme(color: String)
}
