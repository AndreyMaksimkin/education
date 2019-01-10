//
//  TaskFiveViewController.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TaskFiveViewController: UIViewController {
    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var currentDateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Реализовать получение Observable<NSDate> с текущей датой следующим способом: Date.rx.current
        // Создание последовательности вынести в Misc/Reactive
        // По тапу на кнопку currentDateButton (применить rx) выводить в currentDateLabel текущую дату.
        
        currentDateButton.rx.tap
            .subscribe() { event in
                self.btnTapped()
            }
            .disposed(by: disposeBag)
    }
    
    private func btnTapped() {
        print("tap")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        
        
        let numObservable: Observable<NSDate> = NSDate().rx.current
        
        numObservable.map { (date) -> String in
            return formatter.string(from: date as Date)
        }
        .bind(to: currentDateLabel.rx.text)
        
    }
    
    private let disposeBag = DisposeBag()
}
