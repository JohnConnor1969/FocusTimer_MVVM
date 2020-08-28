//
//  ColorManager.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 27.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class ColorManager {
    
    static let shared = ColorManager()
    
    let red = UIColor(red: 237/255, green: 124/255, blue: 90/255, alpha: 1)
    let yellow = UIColor(red: 255/255, green: 202/255, blue: 42/255, alpha: 1)
    let green = UIColor(red: 113/255, green: 208/255, blue: 168/255, alpha: 1)
    let blue = UIColor(red: 68/255, green: 141/255, blue: 247/255, alpha: 1)
    
    let darkGray = UIColor(red: 41/255, green: 41/255, blue: 41/255, alpha: 1)
    let middleGray = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
    let lightGray = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
    
    func returnColorScheme() -> UIColor {
        let colorScheme = UserDefManager.shared.readStringValue(for: "colorScheme")
        var currentColorScheme = UIColor()
        
        switch colorScheme {
        case "red": currentColorScheme = red
        case "yellow": currentColorScheme = yellow
        case "green": currentColorScheme = green
        case "blue": currentColorScheme = blue
        default:
            currentColorScheme = red
        }
        
        return currentColorScheme
    }
}
