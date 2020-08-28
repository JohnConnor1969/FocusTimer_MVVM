//
//  FirstLaunchManager.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 27.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

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
        
        // Создаем Default task
        /*
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)
            else { return }
        
        let taskObject = Task(entity: entity, insertInto: context)
        
        taskObject.title = "Default task"
        taskObject.counter = 0
        do {
            try context.save()
        } catch let error as NSError {
            print (error.localizedDescription)
        }
 */
        
        // Создаем первоначальные ключи и настройки
        // Не оптимальное решение - реализовать на enum
        //UserDefaults.standard.set("work", forKey: "currentIntervalType")
        
        UserDefManager.shared.saveIntValue(value: 8, key: "workInterval")
        UserDefManager.shared.saveIntValue(value: 3, key: "breakInterval")
        UserDefManager.shared.saveStringValue(value: "green", key: "colorScheme")
        
        
        
        UserDefaults.standard.set(true, forKey: "isWorkIntervalType")
        UserDefaults.standard.set("Default task", forKey: "lastTask")
        

    }
}
