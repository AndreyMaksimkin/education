//
//  TaskOneViewController.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TaskOneViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Реализовать подписку на последовательность, используя метод subscribe. Реализовать только те замыкания сигналов, которые могут быть вызваны. Замыкания для сигналов, которые никогда не будут прокинуты текущей последовательностью, не должны быть реализованы.
        
        TaskOneService
            .generateRandom()
            .subscribe { (e: Event<Int>) in
                print(e)
        }
        .disposed(by: disposeBag)
    }
    
    private let disposeBag = DisposeBag()
}
