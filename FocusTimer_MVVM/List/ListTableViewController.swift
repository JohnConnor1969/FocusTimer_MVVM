//
//  ListTableViewController.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 27.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    private var viewModel: ListViewModelProtocol!
    
    override func viewDidLoad() {
        setUpTaskListUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel = ListViewModel()
        viewModel.getTasks()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfRows() ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        cell.viewModel = cellViewModel
        cell.setUpTaskCellUI()

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            if viewModel.numberOfRows() == 1 {
                //alert(title: "Error", message: "You cannot delete a single task!")
            }  else {
                viewModel.deleteTask(indexPath: indexPath)
                tableView.deleteRows(at: [indexPath], with: .fade)

            }
        }
    }
    
    // MARK: - Functions
    
    @IBAction func addNewTaskAction(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add new task", message: "Enter task", preferredStyle: .alert)
        
        let save = UIAlertAction(title: "Save", style: .default) { action in
            
            let tf = alert.textFields?.first
            if let newTaskTitle = tf?.text {
                self.viewModel.addNewTask(title: newTaskTitle)
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
            }
        }
        
        alert.addTextField { _ in }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in })
        
        alert.addAction(save)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    




}
