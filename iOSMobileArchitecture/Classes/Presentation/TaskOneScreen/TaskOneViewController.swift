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
    
    // 1
    enum MyError: Error {
        case anError
    }
    
    @IBOutlet weak var parameterOneTextField: UITextField!
    @IBOutlet weak var parameterTwoTextField: UITextField!
    @IBOutlet weak var requestButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //generateObservable()
        //transformObservables()
        //generateSubjects()
        
        
        // По тапу на кнопку requestButton (применить rx) реализовать подписку на последовательность, созданную в TaskOneService, используя метод из TaskOneViewModel. Если последовательность завершается ошибкой, в resultLabel отображать строку "Ошибка", иначе "Успешно".
        
//        requestButton.rx.tap
//            .subscribe() { event in
//                TaskOneViewModel().so
//        }
//        .disposed(by: disposeBag)
        
    }
    
    //MARK: - Creating observables
    private func generateObservable() {
        //создающие операторы
        
        //create
//        let source : Observable<Any> = Observable.create { observer in
//            for i in 1...5 {
//                observer.on(.next(i))
//            }
//            observer.on(.completed)
//
//            // Note that this is optional. If you require no cleanup you can return
//            // `Disposables.create()` (which returns the `NopDisposable` singleton)
//            return Disposables.create {
//                print("disposed")
//            }
//        }
//
//        source.subscribe {
//            print($0)
//        }.disposed(by: disposeBag)
        //////////////////////////////////////////////////////////////////
        
        //defer
//        var i = 1
//        let deferredJustObservable = Observable.deferred
//        {
//            Observable.just(i)
//        }
//        i = 2
//
//        _ = deferredJustObservable.subscribe( { print ("i = \($0)") } )
        //////////////////////////////////////////////////////////////////
        
        //Empty/Never
        //заканчивается комплитом
//        let sequenceEmpty = Observable<Int>.empty()
//        sequenceEmpty.subscribe { print($0)
//        }.disposed(by: disposeBag)
        
        //не будет ни одного события
        let sequenceNever = Observable<Int>.never()
        sequenceNever.subscribe { print($0)
        }.disposed(by: disposeBag)
        //////////////////////////////////////////////////////////////////
        
        //From
//        let numbers = [1,2,3,4,5]
//
//        let source = Observable.from(numbers)
        //let source  = Observable.of(numbers)

//        source.subscribe {
//            print($0)
//        }.disposed(by: disposeBag)
        //////////////////////////////////////////////////////////////////
        
        //Interval
//        let sequence = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
//        sequence.subscribe { print($0)
//        }.disposed(by: disposeBag)
        //////////////////////////////////////////////////////////////////
        
        //Just
//        let source = Observable.just(1)
//
//        source.subscribe {
//            print($0)
//        }.disposed(by: disposeBag)
        //////////////////////////////////////////////////////////////////
        
        //Range
//        let sequence = Observable.range(start: 5, count: 3)
//        sequence.subscribe {
//            print($0)
//        }.disposed(by: disposeBag)
        //////////////////////////////////////////////////////////////////
        
        //Repeat
//        let sequence = Observable.repeatElement(2, scheduler: MainScheduler.instance)
//        sequence.subscribe {
//            print($0)
//        }.disposed(by: disposeBag)
        //////////////////////////////////////////////////////////////////
        
        //Timer
//        let sequence = Observable<Int64>.timer(2, period: 3, scheduler: MainScheduler.instance)
//        sequence.subscribe {
//            print($0)
//        }.disposed(by: disposeBag)
        //////////////////////////////////////////////////////////////////
        
    }
    
    //MARK: - Transforming Observables
    private func transformObservables() {
        //buffer
        let varA = Variable<Int>(0)
        
        let bufferSequence = varA.asObservable()
            .buffer(timeSpan: 3, count: 3, scheduler: MainScheduler.instance)
        bufferSequence.subscribe {
            print("\(NSDate()) - \($0)")
        }.disposed(by: disposeBag)
        varA.value = 1
        varA.value = 2
        varA.value = 3
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            varA.value = 4
            varA.value = 5
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                varA.value = 6
            }
        }
        
        //////////////////////////////////////////////////////////////////
        
        //FlatMap
        //////////////////////////////////////////////////////////////////
        
        //GroupBy
        //////////////////////////////////////////////////////////////////
        
        //Map
        //////////////////////////////////////////////////////////////////
        
        //Scan
        //////////////////////////////////////////////////////////////////
        
        //Window
        //////////////////////////////////////////////////////////////////
        
        
        
    }
    
    //MARK: - Subjects
    private func generateSubjects() {
        //PublishSubject
//        let subject = PublishSubject<String>()
//        subject.onNext("Is anyone listening?")
//        let subscriptionOne = subject
//            .subscribe(onNext: { string in
//                print(string)
//            })
//        subject.on(.next("1"))
//        subject.onNext("2")
//
//        let subscriptionTwo = subject
//            .subscribe { event in
//                print("2)", event.element ?? event)
//        }
//        subject.onNext("3")
//
//        subscriptionOne.dispose()
//        subject.onNext("4")
//
//        // 1
//        subject.onCompleted()
//        // 2
//        subject.onNext("5")
//        // 3
//        subscriptionTwo.dispose()
//        let disposeBag = DisposeBag()
//        // 4
//        subject
//            .subscribe {
//                print("3)", $0.element ?? $0)
//            }
//            .disposed(by: disposeBag)
//        subject.onNext("?")
        
        //////////////////////////////////////////////////////////////////
        
        //BehaviorSubject
//        let subject = BehaviorSubject(value: "Initial value")
//        let disposeBag = DisposeBag()
//
//        subject.onNext("X")
//
//        subject
//            .subscribe {
//                self.printCustom(label: "1)", event: $0)
//            }
//            .disposed(by: disposeBag)
//
//        // 1
//        subject.onError(MyError.anError)
//        // 2
//        subject
//            .subscribe {
//                self.printCustom(label: "2)", event: $0)
//            }
//            .disposed(by: disposeBag)
        //////////////////////////////////////////////////////////////////
        
        //ReplaySubject
//        let subject = ReplaySubject<String>.create(bufferSize: 2)
//        let disposeBag = DisposeBag()
//        // 2
//        subject.onNext("1")
//        subject.onNext("2")
//        subject.onNext("3")
//
//        // 3
//        subject
//            .subscribe {
//                self.printCustom(label: "1)", event: $0)
//            }.disposed(by: disposeBag)
//
//        subject
//            .subscribe {
//                self.printCustom(label: "2)", event: $0)
//            }
//            .disposed(by: disposeBag)
//
//        subject.onNext("4")
//        subject.onError(MyError.anError)
//        subject
//            .subscribe {
//                self.printCustom(label: "3)", event: $0)
//            }
//            .disposed(by: disposeBag)
        //////////////////////////////////////////////////////////////////
        
        //PublishRelay
//        let relay = PublishRelay<String>()
//        let disposeBag = DisposeBag()
//        relay.accept("Knock knock, anyone home?")
//
//        relay
//            .subscribe(onNext: {
//                print($0) })
//            .disposed(by: disposeBag)
//        relay.accept("1")
        //////////////////////////////////////////////////////////////////
        
        //BehaviorRelay
        // 1
        let relay = BehaviorRelay(value: "Initial value")
        let disposeBag = DisposeBag()
        // 2
        relay.accept("New initial value")
        // 3
        relay
            .subscribe {
                self.printCustom(label: "1)", event: $0)
            }
            .disposed(by: disposeBag)
        
        // 1
        relay.accept("1")
        // 2
        relay
            .subscribe {
                self.printCustom(label: "2)", event: $0)
            }
            .disposed(by: disposeBag)
        // 3
        relay.accept("2")
        print(relay.value)
        //////////////////////////////////////////////////////////////////
        
    }
    
    
    // 2
    func printCustom<T: CustomStringConvertible>(label: String, event: Event<T>) {
        
        if let element = event.element {
            print(label, element)
        } else if let error = event.error {
            print(label, error)
        } else {
            print(label, event)
        }
    }
    
}
