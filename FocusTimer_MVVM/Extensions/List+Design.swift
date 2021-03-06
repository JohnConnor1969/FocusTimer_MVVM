//
//  List+Design.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 28.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

extension ListTableViewController {
    func setUpTaskListUI() {
        tableView.rowHeight = 45

        view.backgroundColor = ColorManager.shared.darkGray
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: ColorManager.shared.lightGray ]
    }
}
