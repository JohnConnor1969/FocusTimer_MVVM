//
//  ListViewModelProtocol.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 29.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

protocol ListViewModelProtocol {
    var tasks: [Task] { get }
    
    func numberOfRows() -> Int?
    func cellViewModel(forIndexPath indexPath: IndexPath) -> ListCellViewModelProtocol?
    func getTasks()
    func addNewTask(title: String)
    func deleteTask(indexPath: IndexPath)
}
