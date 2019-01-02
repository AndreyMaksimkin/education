//
//  TaskTwoViewController.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TaskTwoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let taskTwoService = TaskTwoService()
        
        // Реализовать подписку на последовательность, используя оператор subscribe. Реализовать только те замыкания сигналов, которые могут быть вызваны. Замыкания для сигналов, которые никогда не будут прокинуты текущей последовательностью, не должны быть реализованы.
        
        taskTwoService
            .generateByCreate()
            .subscribe { (e: Event<[String]>) in
                //print(e)
            }
            .disposed(by: disposeBag)
        
        // Реализовать подписку на последовательность, используя оператор subscribe. Реализовать только те замыкания сигналов, которые могут быть вызваны. Замыкания для сигналов, которые никогда не будут прокинуты текущей последовательностью, не должны быть реализованы.
        
        taskTwoService
            .generateByOf()
            .subscribe { (e: Event<[String]>) in
                print(e)
        }
        .disposed(by: disposeBag)
        
    }
    
    private let disposeBag = DisposeBag()
}
