//
//  ListCell+Design.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 28.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

extension ListTableViewCell {
    func setUpTaskCellUI() {
        taskTitle.textColor = ColorManager.shared.lightGray
        taskIntervalCounter.textColor = ColorManager.shared.lightGray
        
        backgroundColor = ColorManager.shared.darkGray
    }
}
