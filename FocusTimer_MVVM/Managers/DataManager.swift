//
//  DataManager.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 30.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation
import CoreData

class DataManager {
    
    static let shared = DataManager()
    
    func getTasks() -> [TaskEntity] {
        var tasksEntity: [TaskEntity] = []
        
        let fetchReques: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchReques.sortDescriptors = [sortDescriptor]
        do {
            tasksEntity = try context.fetch(fetchReques)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return tasksEntity
    }
    
    func addNewTask(title: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: "TaskEntity", in: context)
            else { return }
        
        let taskObject = TaskEntity(entity: entity, insertInto: context)
        
        taskObject.title = title
        taskObject.counter = 0
        // Сохранение
        do {
            try context.save()
            //tasks.append(taskObject)
            //tasks.insert(taskObject, at: 0)
        } catch let error as NSError {
            print (error.localizedDescription)
        }
    }
}
