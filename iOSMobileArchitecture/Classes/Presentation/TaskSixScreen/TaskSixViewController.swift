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
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var valueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // По тапу на кнопку valueButton (применить rx) выводить в valueLabel значение, которое эмити последовательность, созданная в TaskSixService. В случае, если последовательность завершается ошибкой, в valueLabel отображать текст "Ошибка". Нельзя использовать оператор subscribe.
        
        
        
        
        valueButton.rx.tap.flatMapLatest {
            return TaskSixService.generate().catchErrorJustReturn("Ошибка")
            }
        .bind(to: rx.labelText)
        .disposed(by: disposeBag)
        
        
//        valueButton.rx.tap
//            .flatMapLatest({ _ -> Observable<Void> in
//                return Observable<Void>
//                    .just()
//                    .flatMap({ (_) -> Observable<Void> in
//                        throw NSError(domain: "", code: 0, userInfo: [:])
//                    })
//                    .catchError({ error -> Observable<Void> in
//                        return Observable<Void>.just()
//                    })
//            })
//            .subscribe()
        
        
//        valueButton.rx.tap
//            .subscribe() { event in
//                self.btnTapped()
//            }
//            .disposed(by: disposeBag)
        //flatMapLatest надо использовать
        
    }
    
    private func btnTapped() {
        
        let observable = TaskSixService.generate().catchErrorJustReturn("Ошибка")
        observable.bind(to: rx.labelText)
            //observable.bind(to: labelText)
            //.bind(to: labelText)
//            .subscribe(onNext: { results in
//                print(results)
//            }, onError: { error in
//                print("error")
//            }, onDisposed: {
//                print("disposed")
//            })

        
        
        
        
//        observable.map { (string) -> String in
//            if let str = string as? String {
//                return str
//            } else {
//                return "Ошибка"
//            }
//        }
            //.bind(to: valueLabel.rx.text)
            .disposed(by: disposeBag)
        
    }
    
    private let disposeBag = DisposeBag()
}

extension Reactive where Base: TaskSixViewController {
    
    var labelText: Binder<String> {
        return Binder(base) { base, text in
            base.valueLabel.text = text
        }
    }
}
