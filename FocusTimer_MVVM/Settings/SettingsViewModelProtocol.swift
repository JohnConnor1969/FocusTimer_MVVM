//
//  SettingsViewModelProtocol.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 28.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

protocol SettingsViewModelProtocol {
    
    func saveInterval(value: Int, type: String)
    func saveColorScheme(color: String)
}
