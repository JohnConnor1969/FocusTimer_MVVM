//
//  ListTableViewCell.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 27.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet var taskTitle: UILabel!
    @IBOutlet var taskIntervalCounter: UILabel!

    var viewModel: ListCellViewModelProtocol! {
        didSet {
            taskTitle.text = viewModel.title
            taskIntervalCounter.text = "\(viewModel.counter)"
        }
    }
}
