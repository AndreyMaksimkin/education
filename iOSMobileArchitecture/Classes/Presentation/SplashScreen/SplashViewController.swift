//
//  SplashViewController.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SplashViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Observable<Void>
            .just(Void())
            .delaySubscription(2, scheduler: MainScheduler.instance)
            .bind(to: rx.goToTaskSixScreen) // Для проверки заданий менять на соответствующий экран
            .disposed(by: disposeBag)
    }
    
    private let disposeBag = DisposeBag()
}

extension Reactive where Base: SplashViewController {
    var goToTaskOneScreen: Binder<Void> {
        return Binder(base) { base, _ in
            let vc = UIStoryboard(name: "TaskOneScreen", bundle: nil).instantiateViewController(withIdentifier: "TaskOneViewController")
            let nc = UINavigationController(rootViewController: vc)
            UIApplication.shared.keyWindow?.rootViewController = nc
        }
    }
    
    var goToTaskTwoScreen: Binder<Void> {
        return Binder(base) { base, _ in
            let vc = TaskTwoViewController()
            let nc = UINavigationController(rootViewController: vc)
            UIApplication.shared.keyWindow?.rootViewController = nc
        }
    }
    
    var goToTaskThreeScreen: Binder<Void> {
        return Binder(base) { base, _ in
            let vc = UIStoryboard(name: "TaskThreeScreen", bundle: nil).instantiateViewController(withIdentifier: "TaskThreeViewController")
            let nc = UINavigationController(rootViewController: vc)
            UIApplication.shared.keyWindow?.rootViewController = nc
        }
    }
    
    var goToTaskFourScreen: Binder<Void> {
        return Binder(base) { base, _ in
            let vc = UIStoryboard(name: "TaskFourScreen", bundle: nil).instantiateViewController(withIdentifier: "TaskFourViewController")
            let nc = UINavigationController(rootViewController: vc)
            UIApplication.shared.keyWindow?.rootViewController = nc
        }
    }
    
    var goToTaskFiveScreen: Binder<Void> {
        return Binder(base) { base, _ in
            let vc = UIStoryboard(name: "TaskFiveScreen", bundle: nil).instantiateViewController(withIdentifier: "TaskFiveViewController")
            let nc = UINavigationController(rootViewController: vc)
            UIApplication.shared.keyWindow?.rootViewController = nc
        }
    }
    
    var goToTaskSixScreen: Binder<Void> {
        return Binder(base) { base, _ in
            let vc = UIStoryboard(name: "TaskSixScreen", bundle: nil).instantiateViewController(withIdentifier: "TaskSixViewController")
            let nc = UINavigationController(rootViewController: vc)
            UIApplication.shared.keyWindow?.rootViewController = nc
        }
    }
}
