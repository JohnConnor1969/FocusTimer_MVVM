//
//  ListCellViewModelProtocol.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 29.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

protocol ListCellViewModelProtocol: class {
    var title: String { get }
    var counter: Int { get }
    
    init(task: Task)
}
