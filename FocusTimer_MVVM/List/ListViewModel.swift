//
//  ListViewModel.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 29.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

class ListViewModel: ListViewModelProtocol {

    var tasks: [Task] = []
    
    private var indexPath: IndexPath?

    func numberOfRows() -> Int? {
        return tasks.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> ListCellViewModelProtocol? {
        let task = tasks[indexPath.row]
        return ListCellViewModel(task: task)
    }
    
    func getTasks() {
        let tasksEntity = DataManager.shared.getTasks()
        
        for task in tasksEntity {
            tasks.append(Task(title: task.title ?? "", counter: Int(task.counter)))
        }
    }
    
    func addNewTask(title: String) {
        DataManager.shared.addNewTask(title: title)
        tasks.insert(Task(title: title, counter: 0), at: 0)
    }

    func deleteTask(indexPath: IndexPath) {
        let tasksEntity = DataManager.shared.getTasks()

        DataManager.shared.deleteTask(taskEntity: tasksEntity[indexPath.row])
        
        tasks.remove(at: indexPath.row)
    }
    
}
