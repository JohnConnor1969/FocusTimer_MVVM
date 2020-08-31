//
//  TimerViewController.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 27.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController  {
    
    let viewModel = TimerViewModel()

    var isWorkIntervalType: Bool!
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
        
        let viewModel = TimerViewModel()
                
        isWorkIntervalType = viewModel.isWorkIntervalType
        
        viewModel.getTasks()
        
        intervalManage()
        
        


        
        choiceInterval(currentTaskTextField)
        addToolBar(currentTaskTextField)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpTaskTimerUI()
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
        
        if isWorkIntervalType {
            isWorkIntervalType = false
            mainTimer = UserDefManager.shared.readIntValue(key: "breakInterval")
            seconds = mainTimer
            timelabel.text = viewModel.timeString(time: Double(mainTimer))
            
        } else {
            mainTimer = UserDefManager.shared.readIntValue(key: "workInterval")
            seconds = mainTimer
            isWorkIntervalType = true
            timelabel.text = viewModel.timeString(time: Double(mainTimer))
        }
    }
    

    

}

// MARK: - Timer

extension TimerViewController {
    
 
    
    @objc private func countDownTimer() {
        seconds -= 1
        timelabel.text = viewModel.timeString(time: TimeInterval(seconds))
        
        if (seconds == 0) {
            
            if isWorkIntervalType {
                isWorkIntervalType = false
                mainTimer = UserDefManager.shared.readIntValue(key: "breakInterval")
                seconds = mainTimer
                timelabel.text = viewModel.timeString(time: TimeInterval(mainTimer))
                //alertTimerTo(title: "Timer", message: "Time to break")
                //counterIncrease()
                viewModel.counterIncrease(title: currentTaskTextField.text!)
            } else {
                mainTimer = UserDefManager.shared.readIntValue(key: "workInterval")
                seconds = mainTimer
                timelabel.text = viewModel.timeString(time: TimeInterval(mainTimer))
                isWorkIntervalType = true
                //alertTimerTo(title: "Timer", message: "Time to work")
            }
            
            timer.invalidate()
        }
    }
    
    func intervalManage() {
        if isWorkIntervalType {
            mainTimer = UserDefManager.shared.readIntValue(key: "workInterval")
        } else {
            mainTimer = UserDefManager.shared.readIntValue(key: "breakInterval")
        }
        
        seconds = mainTimer
        timelabel.text = viewModel.timeString(time: Double(mainTimer))
    }
}

