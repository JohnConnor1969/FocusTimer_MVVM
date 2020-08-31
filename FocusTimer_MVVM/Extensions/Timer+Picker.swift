//
//  Timer+Picker.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 31.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

extension TimerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func choiceInterval(_ textField: UITextField) {
        let intervalPicker = UIPickerView()
        intervalPicker.delegate = self
        
        textField.inputView = intervalPicker
        intervalPicker.backgroundColor = ColorManager.shared.darkGray
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.tasks.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(viewModel.tasks[row].title)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPickerElement = String(viewModel.tasks[row].title)
        currentTaskTextField.text = selectedPickerElement
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerViewLabel = UILabel()
        
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        } else {
            pickerViewLabel = UILabel()
        }
        
        pickerViewLabel.textColor = .white
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        pickerViewLabel.text = String(viewModel.tasks[row].title)
        
        return pickerViewLabel
    }
    
}
