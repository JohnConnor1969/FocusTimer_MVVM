//
//  Timer+Design.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 28.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation
extension TimerViewController {
    
    func setUpTaskTimerUI() {
        
        let currentColorScheme = ColorManager.shared.returnColorScheme()
        
        view.backgroundColor = ColorManager.shared.darkGray
        
        timelabel.textColor = currentColorScheme
        
        currentTaskTextField.backgroundColor = ColorManager.shared.darkGray
        currentTaskTextField.textColor = currentColorScheme
        
        if let lastTask = UserDefaults.standard.value(forKey: "lastTask") as? String {
            currentTaskTextField.text = lastTask
        }
        
        startButton.backgroundColor = ColorManager.shared.darkGray
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = ColorManager.shared.lightGray.cgColor
        startButton.tintColor = ColorManager.shared.lightGray
        startButton.layer.cornerRadius = 4
        
        pauseButton.backgroundColor = ColorManager.shared.darkGray
        pauseButton.layer.borderWidth = 2
        pauseButton.layer.borderColor = ColorManager.shared.lightGray.cgColor
        pauseButton.tintColor = ColorManager.shared.lightGray
        pauseButton.layer.cornerRadius = 4
        
        skipButton.backgroundColor = ColorManager.shared.darkGray
        skipButton.layer.borderWidth = 2
        skipButton.layer.borderColor = ColorManager.shared.lightGray.cgColor
        skipButton.tintColor = ColorManager.shared.lightGray
        skipButton.layer.cornerRadius = 4
    }
}
