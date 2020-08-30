//
//  Settings+Design.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 28.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

extension SettingsTableViewController {
    func setUpSettingsUI() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: ColorManager.shared.lightGray ]
        
        tableView.backgroundColor = ColorManager.shared.darkGray
        
        workIntervalLabel.textColor = ColorManager.shared.lightGray
        
        workIntervalTextField.backgroundColor = ColorManager.shared.darkGray
        workIntervalTextField.textColor = ColorManager.shared.lightGray
        
        workIntervalTextField.layer.borderWidth = 1
        workIntervalTextField.layer.borderColor = ColorManager.shared.lightGray.cgColor
        workIntervalTextField.layer.cornerRadius = 6
        
        breakIntervalLabel.textColor = ColorManager.shared.lightGray
        
        breakIntervalTextField.backgroundColor = ColorManager.shared.darkGray
        breakIntervalTextField.textColor = ColorManager.shared.lightGray
        
        breakIntervalTextField.layer.borderWidth = 1
        breakIntervalTextField.layer.borderColor = ColorManager.shared.lightGray.cgColor
        breakIntervalTextField.layer.cornerRadius = 6
        
        redSchemeButton.backgroundColor = ColorManager.shared.red
        redSchemeButton.tintColor = ColorManager.shared.darkGray
        redSchemeButton.layer.cornerRadius = 4
        redSchemeButton.setTitle("", for: .normal)
        
        yellowSchemeButton.backgroundColor = ColorManager.shared.yellow
        yellowSchemeButton.tintColor = ColorManager.shared.darkGray
        yellowSchemeButton.layer.cornerRadius = 4
        yellowSchemeButton.setTitle("", for: .normal)
        
        greenSchemeButton.backgroundColor = ColorManager.shared.green
        greenSchemeButton.tintColor = ColorManager.shared.darkGray
        greenSchemeButton.layer.cornerRadius = 4
        greenSchemeButton.setTitle("", for: .normal)
        
        blueSchemeButton.backgroundColor = ColorManager.shared.blue
        blueSchemeButton.tintColor = ColorManager.shared.darkGray
        blueSchemeButton.layer.cornerRadius = 4
        blueSchemeButton.setTitle("", for: .normal)
    }
}
