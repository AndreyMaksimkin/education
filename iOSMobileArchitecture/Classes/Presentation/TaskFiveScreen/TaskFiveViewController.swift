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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Реализовать подписку на последовательность, используя метод subscribe.
        
        TaskFiveService
            .completedByCreate()
            //аналогичное замечание как и в п.1
            .subscribe(onCompleted: {
                print("completed")
            }, onDisposed: {
                print("disposed")
            })
            .disposed(by: disposeBag)
        
        // Реализовать подписку на последовательность, используя метод subscribe.
        
        TaskFiveService
            .completed()
            //аналогичное замечание как и в п.1
            .subscribe(onNext: { results in
                print(results)//!!!
            }, onCompleted: {
                print("completed")
            }, onDisposed: {
                print("disposed")
            })
            .disposed(by: disposeBag)
    }
    
    private let disposeBag = DisposeBag()
}
