//
//  TimerViewController.swift
//  FocusTimer_MVVM
//
//  Created by Valeriy Pokatilo on 27.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    // MARK: - IB Outlets
    
    @IBOutlet var currentTaskTextField: UITextField!
    @IBOutlet var timelabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var pauseButton: UIButton!
    @IBOutlet var skipButton: UIButton!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTaskTimerUI()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpTaskTimerUI()
    }
   
    // MARK: - IB Actions
    
    @IBAction func currentTaskEditingDidBegin(_ sender: UITextField) {
        
    }
    @IBAction func currentTaskEditingDidEnd(_ sender: UITextField) {
        
    }
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func pauseButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func skipButtonAction(_ sender: UIButton) {
        
    }
    
    // MARK: - Functions
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    /*
    override var prefersStatusBarHidden: Bool {
        return true
    }
    */
    

}
