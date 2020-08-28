//
//  SettingsTableViewController.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 27.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    // MARK: - Properties
    var workIntervalValue: String!
    var breakIntervalValue: String!
    
    var viewModel: SettingsViewModelProtocol!
    
    // MARK: - IB Outlets
    
    @IBOutlet var workIntervalLabel: UILabel!
    @IBOutlet var breakIntervalLabel: UILabel!
    
    @IBOutlet var workIntervalTextField: UITextField!
    @IBOutlet var breakIntervalTextField: UITextField!
    
    @IBOutlet var redSchemeButton: UIButton!
    @IBOutlet var yellowSchemeButton: UIButton!
    @IBOutlet var greenSchemeButton: UIButton!
    @IBOutlet var blueSchemeButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SettingsViewModel()
        
        setUpSettingsUI()
        
        addDoneButton(workIntervalTextField)
        addDoneButton(breakIntervalTextField)
        
        workIntervalTextField.text = String(UserDefManager.shared.readIntValue (key: "workInterval"))
        breakIntervalTextField.text = String(UserDefManager.shared.readIntValue(key: "breakInterval"))
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = ColorManager.shared.darkGray
    }
    
    // MARK: - IB Actions
    
    @IBAction func redSchemeButtonAction(_ sender: UIButton) {
        viewModel.saveColorScheme(color: "red")
    }
    
    @IBAction func yellowSchemeButtonAction(_ sender: UIButton) {
        viewModel.saveColorScheme(color: "yellow")
    }
    
    @IBAction func greenSchemeButtonAction(_ sender: UIButton) {
        viewModel.saveColorScheme(color: "green")
    }
    
    @IBAction func blueSchemeButtonAction(_ sender: UIButton) {
        viewModel.saveColorScheme(color: "blue")
    }
    
    @IBAction func workIntervalBeginEditing(_ sender: UITextField) {
        workIntervalValue = workIntervalTextField.text
        workIntervalTextField.placeholder = workIntervalValue
        workIntervalTextField.text = ""
    }
    
    @IBAction func workIntervalEndEditing(_ sender: UITextField) {
        if workIntervalTextField.text == "" {
            workIntervalTextField.text = workIntervalValue
        }
        
        if let newValue = Int(workIntervalTextField.text!), newValue > 0 && newValue < 1000 {
            //guard let text = workIntervalTextField.text else { return }
            //guard let newValueInt = Int(text) else { return }
            viewModel.saveInterval(value: newValue, type: "workInterval")
        } else {
            workIntervalTextField.text = workIntervalValue
            //alert(title: "Error", message: "Wrong format! Enter number from 1 to 999")
        }
    }
    
    @IBAction func breakIntervalBeginEditing(_ sender: UITextField) {
        breakIntervalValue = breakIntervalTextField.text
        breakIntervalTextField.placeholder = breakIntervalValue
        breakIntervalTextField.text = ""
    }
    
    @IBAction func breakIntervalEndEditing(_ sender: UITextField) {
        if breakIntervalTextField.text == "" {
            breakIntervalTextField.text = breakIntervalValue
        }
        
        if let newValue = Int(breakIntervalTextField.text!), newValue > 0 && newValue < 1000 {
            //guard let text = breakIntervalTextField.text else { return }
            //guard let newValueInt = Int(text) else { return }
            viewModel.saveInterval(value: newValue, type: "breakInterval")
        } else {
            breakIntervalTextField.text = breakIntervalValue
            //alert(title: "Error", message: "Wrong format! Enter number from 1 to 999")
        }
    }
}
