//
//  TimerViewModel.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 30.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

class TimerViewModel: TimerViewModelProtocol {
    
    var tasks: [Task] = []
    
    var isWorkIntervalType: Bool {
        get {
            return UserDefManager.shared.readBoolValue(key: "isWorkIntervalType")
        }
        set {
            let currentType = UserDefManager.shared.readBoolValue(key: "isWorkIntervalType")
            UserDefManager.shared.saveBoolValue(value: !currentType, key: "isWorkIntervalType")
        }
    }
    
    func getTasks() {
        let tasksEntity = DataManager.shared.getTasks()
        
        tasks = []
        for task in tasksEntity {
            tasks.append(Task(title: task.title ?? "", counter: Int(task.counter)))
        }
    }
    
    func counterIncrease(title: String) {
        DataManager.shared.counterIncrease(title: title)
    }
    
    func timeString(time: TimeInterval) -> String  {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    func readIntValue(key: String) -> Int {
        UserDefManager.shared.readIntValue(key: key)
    }
}
