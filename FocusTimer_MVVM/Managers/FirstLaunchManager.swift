//
//  FirstLaunchManager.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 27.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation
import CoreData

class FirstLaunchManager {
    
    static let shared = FirstLaunchManager()
    
    var firstLaunch: Bool!
    
    func detectFirstLaunch() {
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "firstLaunch")
        if launchedBefore {
            firstLaunch = false
        } else {
            setValueForFirstLaunch()
            
            UserDefaults.standard.set(true, forKey: "firstLaunch")
            firstLaunch = true
        }
    }
    
    func setValueForFirstLaunch() {
        
        guard let entity = NSEntityDescription.entity(forEntityName: "TaskEntity", in: context)
            else { return }
        
        let taskObject = TaskEntity(entity: entity, insertInto: context)
        
        taskObject.title = "Default task"
        taskObject.counter = 0
        do {
            try context.save()
        } catch let error as NSError {
            print (error.localizedDescription)
        }
        
        UserDefManager.shared.saveIntValue(value: 8, key: "workInterval")
        UserDefManager.shared.saveIntValue(value: 3, key: "breakInterval")
        UserDefManager.shared.saveStringValue(value: "green", key: "colorScheme")
        UserDefManager.shared.saveStringValue(value: "Default task 000", key: "lastTask")
        UserDefManager.shared.saveBoolValue(value: true, key: "isWorkIntervalType")
    }
}
