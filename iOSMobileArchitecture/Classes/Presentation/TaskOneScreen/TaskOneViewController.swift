//
//  TaskOneViewController.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import UIKit

class TaskOneViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Значения, которые эмитит последовательность из TaskOneService, отображать на timerLabel. Использовать метод bind(to: ).
    }
}
