//
//  AppDelegate+Design.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 27.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    func setUpBarsUI() {
        
        UITabBar.appearance().tintColor = ColorManager.shared.lightGray
        UITabBar.appearance().barTintColor = .black
        
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().tintColor = ColorManager.shared.lightGray
    }
}
