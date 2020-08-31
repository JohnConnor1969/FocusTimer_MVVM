//
//  ListCellViewModel.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 29.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

class ListCellViewModel: ListCellViewModelProtocol {
    private var task: Task
    
    var title: String {
        return task.title
    }
    
    var counter: Int {
        return task.counter
    }
    
    required init(task: Task) {
        self.task = task
    }
}
