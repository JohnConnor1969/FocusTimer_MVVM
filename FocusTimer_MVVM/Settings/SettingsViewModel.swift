//
//  SettingsViewModel.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 28.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

class SettingsViewModel: SettingsViewModelProtocol {
    func saveInterval(value: Int, type: String) {
        UserDefManager.shared.saveIntValue(value: value, key: type)
    }
    
    func saveColorScheme(color: String) {
        UserDefManager.shared.saveStringValue(value: color, key: "colorScheme")
    }
    
    
   
}
