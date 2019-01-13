//
//  TaskSixViewController.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TaskSixViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Выполнить подписку на последовательность (см. задание в Misc/TaskSix). В логи распечатать значение, переданное на вход методу, выполнив подписку на последовательность.
        
        
        Observable<Any>
            .generateElements(element: "String")
            //аналогичное замечание как и в п.1
            .subscribe(onNext: { results in
                print(results)
            }, onCompleted: {
                print("completed")
            }, onDisposed: {
                print("disposed")
            })
            .disposed(by: disposeBag)
        
    }
    
    let disposeBag = DisposeBag()
}
