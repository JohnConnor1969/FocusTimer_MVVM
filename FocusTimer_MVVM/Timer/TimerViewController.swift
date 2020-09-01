//
//  TimerViewController.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 27.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController  {
    
    // MARK: - Property
    
    let viewModel = TimerViewModel()

    var timer = Timer()
    var timeRealodTimer = Timer()
    var mainTimer: Int!
    var seconds: Int!
    var selectedPickerElement: String?

    
    // MARK: - IB Outlets
    
    @IBOutlet var currentTaskTextField: UITextField!
    @IBOutlet var timelabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var pauseButton: UIButton!
    @IBOutlet var skipButton: UIButton!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
            
        startSettings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpTaskTimerUI()
    }
    
    // MARK: - Functions
    
    func startSettings() {
        
        viewModel.getTasks()
        
        intervalManage()

        choiceInterval(currentTaskTextField)
        addToolBar(currentTaskTextField)
    }
   
    // MARK: - IB Actions
    
    @IBAction func currentTaskBeginEditing(_ sender: UITextField) {
        viewModel.getTasks()
    }
    
    @IBAction func currentTaskEndEditing(_ sender: UITextField) {
        if let pickedElement = selectedPickerElement {
            currentTaskTextField.text = pickedElement
            UserDefManager.shared.saveStringValue(value: pickedElement, key: "lastTask")
        }
    }
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseButtonAction(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func skipButtonAction(_ sender: UIButton) {
        timer.invalidate()
        
        let key = viewModel.isWorkIntervalType ? "breakInterval" : "workInterval"
        mainTimer = viewModel.readIntValue(key: key)
        viewModel.isWorkIntervalType.toggle()
        seconds = mainTimer
        timelabel.text = viewModel.timeString(time: Double(mainTimer))
    }
}

// MARK: - Timer

extension TimerViewController {
    
    @objc private func countDownTimer() {
        seconds -= 1
        timelabel.text = viewModel.timeString(time: TimeInterval(seconds))
        
        if (seconds == 0) {
            
            viewModel.isWorkIntervalType.toggle()
            
            if viewModel.isWorkIntervalType {
                mainTimer = viewModel.readIntValue(key: "breakInterval")
                showAlert(title: "Timer", message: "Time to break")
                viewModel.counterIncrease(title: currentTaskTextField.text!)
            } else {
                mainTimer = viewModel.readIntValue(key: "workInterval")
                showAlert(title: "Timer", message: "Time to work")
            }
            
            timelabel.text = viewModel.timeString(time: TimeInterval(mainTimer))
            seconds = mainTimer
            
            timer.invalidate()
        }
    }
    
    func intervalManage() {
        let key = viewModel.isWorkIntervalType ? "breakInterval" : "workInterval"
        mainTimer = viewModel.readIntValue(key: key)
        
        seconds = mainTimer
        timelabel.text = viewModel.timeString(time: Double(mainTimer))
    }
}

