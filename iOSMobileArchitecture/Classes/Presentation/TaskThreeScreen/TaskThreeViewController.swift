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
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numObservable: Observable<Int> = TaskThreeService().generateFromTimer()
        numObservable.bind(to: rx.labelColor)
        .disposed(by: disposeBag)
        numObservable.map({ String($0) })
        .bind(to: valueLabel.rx.text)
        .disposed(by: disposeBag)
        //numObservable.map({ String($0) })
        
        // Последовательность, созданная в TaskThreeService, эмитит число. Отображать это значение в valueLabel. Если число кратно 2, цвет текста зеленого цвета, иначе красного цвета. Использовать оператор map. Нельзя использовать оператор subscribe.
    }
    
    private let disposeBag = DisposeBag()
}

extension Reactive where Base: TaskThreeViewController {
    
    var labelColor: Binder<Int> {
        return Binder(base) { base, number in
            base.valueLabel.textColor = number % 2 == 0 ? .green : .red
        }
    }
}
