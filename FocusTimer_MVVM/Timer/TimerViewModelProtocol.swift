//
//  TimerViewModelProtocol.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 30.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

protocol TimerViewModelProtocol: class {
    var tasks: [Task] { get }
    var isWorkIntervalType: Bool { get set }
    
    func getTasks()
    func counterIncrease(title: String)
    func timeString(time: TimeInterval) -> String
    func readIntValue(key: String) -> Int
}
