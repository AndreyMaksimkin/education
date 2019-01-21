//
//  TaskFourViewController.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TaskFourViewController: UIViewController {
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numObservable: Observable<Int> = TaskFourService().generateFromTimer()
        numObservable.bind(to: rx.labelColor)
            .disposed(by: disposeBag)
        numObservable.map({ String($0) })
            .bind(to: valueLabel.rx.text)
            .disposed(by: disposeBag)
        
        // Последовательность, созданная в TaskFourService, эмитит число. Отображать это значение в valueLabel. Если число кратно 2, цвет текста зеленого цвета, иначе красного цвета. Нельзя использовать оператор subscribe.
    }
    
    private let disposeBag = DisposeBag()
}

extension Reactive where Base: TaskFourViewController {
    
    var labelColor: Binder<Int> {
        return Binder(base) { base, number in
            base.valueLabel.textColor = number % 2 == 0 ? .green : .red
        }
    }
}

