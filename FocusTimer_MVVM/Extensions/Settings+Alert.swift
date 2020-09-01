//
//  Settings+Alert.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 01.09.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

extension SettingsTableViewController {
    
    func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
}
