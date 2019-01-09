//
//  TaskThreeViewController.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TaskThreeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Реализовать подписку на последовательность, используя оператор subscribe. Реализовать только те замыкания сигналов, которые могут быть вызваны. Замыкания для сигналов, которые никогда не будут прокинуты текущей последовательностью, не должны быть реализованы.
        
        //почитай, зачем нужен disposeBag
        //xCode не зря делает warning Result of call to 'subscribe' is unused
        TaskThreeService
            .generateErrorByCreate()
            //аналогичное замечание как и в п.1
            .subscribe { (e: Event<Int>) in
                //print(e)
        }
        
        // Реализовать подписку на последовательность, используя оператор subscribe. Реализовать только те замыкания сигналов, которые могут быть вызваны. Замыкания для сигналов, которые никогда не будут прокинуты текущей последовательностью, не должны быть реализованы.
        
        TaskThreeService
            .generateError()
            //аналогичное замечание как и в п.1
            .subscribe { (e: Event<Int>) in
                print(e)
        }
        .disposed(by: disposeBag)
    }
    
    private let disposeBag = DisposeBag()
}
