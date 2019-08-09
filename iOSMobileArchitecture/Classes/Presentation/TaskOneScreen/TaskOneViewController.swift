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
    
    enum Weather {
        case cloudy
        case sunny
    }
    
    struct Student {
        let score: BehaviorSubject<Int>
    }
    
    @IBOutlet weak var parameterOneTextField: UITextField!
    @IBOutlet weak var parameterTwoTextField: UITextField!
    @IBOutlet weak var requestButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //combineObservable()
        //generateObservable()
        //transformObservables()
        //generateSubjects()
        
        
        // По тапу на кнопку requestButton (применить rx) реализовать подписку на последовательность, созданную в TaskOneService, используя метод из TaskOneViewModel. Если последовательность завершается ошибкой, в resultLabel отображать строку "Ошибка", иначе "Успешно".
        
        requestButton.rx.tap
            .subscribe() { event in
                
        }
        .disposed(by: disposeBag)
        
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
        //toArray
//        let disposeBag = DisposeBag()
//        // 1
//        Observable.of("A", "B", "C")
//            // 2
//            .toArray()
//            .subscribe(onNext: {
//                print($0) })
//            .disposed(by: disposeBag)
        //////////////////////////////////////////////////////////////////
        
        //Map first
//        let disposeBag = DisposeBag()
//        // 1
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .spellOut
//        // 2
//        Observable<Int>.of(123, 4, 56)
//            // 3
//            .map {
//                formatter.string(for: $0) ?? ""
//            }
//            .subscribe(onNext: {
//                print($0)
//            })
//            .disposed(by: disposeBag)
        //////////////////////////////////////////////////////////////////
        
        //Map second
//        let disposeBag = DisposeBag()
//        // 1
//        Observable.of(1, 2, 3, 4, 5, 6)
//            // 2
//            .enumerated()
//            // 3
//            .map { index, integer in
//                index > 2 ? integer * 2 : integer
//            }
//            // 4
//            .subscribe(onNext: {
//                print($0)
//            })
//            .disposed(by: disposeBag)
        //////////////////////////////////////////////////////////////////
        
        //FlatMap
//        let disposeBag = DisposeBag()
//        // 1
//        let laura = Student(score: BehaviorSubject(value: 80))
//        let charlotte = Student(score: BehaviorSubject(value: 90))
//        // 2
//        let student = PublishSubject<Student>()
//        // 3
//        student
//            .flatMap {
//                $0.score }
//            // 4
//            .subscribe(onNext: {
//                print($0)
//            })
//            .disposed(by: disposeBag)
//        student.onNext(laura)
//        laura.score.onNext(85)
//        student.onNext(charlotte)
//        laura.score.onNext(95)
        
        //////////////////////////////////////////////////////////////////
        
        //flatMapLatest first
//        let disposeBag = DisposeBag()
//        let laura = Student(score: BehaviorSubject(value: 80))
//        let charlotte = Student(score: BehaviorSubject(value: 90))
//        let student = PublishSubject<Student>()
//        student
//            .flatMapLatest {
//                $0.score }
//            .subscribe(onNext: {
//                print($0)
//            })
//            .disposed(by: disposeBag)
//        student.onNext(laura)
//        laura.score.onNext(85)
//        student.onNext(charlotte)
//        // 1
//        laura.score.onNext(95)
//        charlotte.score.onNext(100)
        //////////////////////////////////////////////////////////////////
        
        //flatMapLatest second
//        let disposeBag = DisposeBag()
//        // 2
//        let laura = Student(score: BehaviorSubject(value: 80))
//        let charlotte = Student(score: BehaviorSubject(value: 100))
//        let student = BehaviorSubject(value: laura)
//
//        let studentScore = student
//            .flatMapLatest {
//                $0.score.materialize() }
//        // 2
//        studentScore
//            // 1
//            .filter {
//                guard $0.error == nil else {
//                    print($0.error!)
//                    return false
//                }
//                return true
//            }
//            // 2
//            .dematerialize()
//            .subscribe(onNext: {
//                print($0) })
//            .disposed(by: disposeBag)
//        // 3
//        laura.score.onNext(85)
//        laura.score.onError(MyError.anError)
//        laura.score.onNext(90)
//        // 4
//        student.onNext(charlotte)
        //////////////////////////////////////////////////////////////////
        
        //buffer
//        let varA = Variable<Int>(0)
//
//        let bufferSequence = varA.asObservable()
//            .buffer(timeSpan: 3, count: 3, scheduler: MainScheduler.instance)
//        bufferSequence.subscribe {
//            print("\(NSDate()) - \($0)")
//        }.disposed(by: disposeBag)
//        varA.value = 1
//        varA.value = 2
//        varA.value = 3
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//            varA.value = 4
//            varA.value = 5
//            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//                varA.value = 6
//            }
//        }
        
        //////////////////////////////////////////////////////////////////
        
        //Scan
        let sequence = Observable.of(1, 2, 3).scan(10) { result, element in
            return result + element
        }
        sequence.subscribe {
            print($0)
        }.disposed(by: disposeBag)
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
    
    //MARK: - Combining
    private func combineObservable() {
        
        
        
        //CombineLatest
//        let left = PublishSubject<String>()
//        let right = PublishSubject<String>()
//
//        // 1
//        let observable = Observable.combineLatest(left, right) {
//            lastLeft, lastRight -> String in
//            return "\(lastLeft) \(lastRight)"
//        }
//        let disposable = observable.subscribe(onNext: { value in
//            print(value)
//        })
//
//        // 2
//        print("> Sending a value to Left")
//        left.onNext("Hello,")
//        print("> Sending a value to Right")
//        right.onNext("world")
//        print("> Sending another value to Right")
//        right.onNext("RxSwift")
//        print("> Sending another value to Left")
//        left.onNext("Have a good day,")
//
//        left.onCompleted()
//        right.onCompleted()
        
        //////////////////////////////////////////////////////////////////
        
        //withLatestFrom
        // 1
        let button = PublishSubject<Void>()
        let textField = PublishSubject<String>()
        // 2
        let observable = button.withLatestFrom(textField)
        _ = observable.subscribe(onNext: { value in
            print(value)
        })
        // 3
        textField.onNext("Par")
        textField.onNext("Pari")
        textField.onNext("Paris")
        button.onNext(())
        button.onNext(())
        //////////////////////////////////////////////////////////////////
        
        //Join
        //////////////////////////////////////////////////////////////////
        
        //Merge
//        let left = PublishSubject<String>()
//        let right = PublishSubject<String>()
//        let source = Observable.of(left.asObservable(), right.asObservable())
//        let observable = source.merge()
//        _ = observable.subscribe(onNext: {
//            print($0)
//        })
        //////////////////////////////////////////////////////////////////
        
        //StartWith
//        let numbers = Observable.of(2, 3, 4)
//        // 2
//        let observable = numbers.startWith(1)
//        _ = observable.subscribe(onNext: { value in
//            print(value)
//        })
        //////////////////////////////////////////////////////////////////
        
        //concat
//        let first = Observable.of(1, 2, 3)
//        let second = Observable.of(4, 5, 6)
//        // 2
//        let observable = Observable.concat([first, second])
//        observable.subscribe(onNext: {
//            print($0)
//        }).disposed(by: disposeBag)
        //////////////////////////////////////////////////////////////////
        
        //concatMap
//        let sequences = [
//            "German cities": Observable.of("Berlin", "Münich", "Frankfurt"),
//            "Spanish cities": Observable.of("Madrid", "Barcelona", "Valencia")
//        ]
//        // 2
//        let observable = Observable.of("German cities", "Spanish cities")
//            .concatMap { country in sequences[country] ?? .empty() }
//        // 3
//        _ = observable.subscribe(onNext: { string in
//            print(string)
//        })
        //////////////////////////////////////////////////////////////////
        
        //Switch
        //////////////////////////////////////////////////////////////////
        
        //Zip
//        let left: Observable<Weather> = Observable.of(.sunny, .cloudy, .cloudy,
//                                                      .sunny)
//        let right = Observable.of("Lisbon", "Copenhagen", "London", "Madrid",
//                                  "Vienna")
//        let observable = Observable.zip(left, right) { weather, city in
//            return "It's \(weather) in \(city)"
//        }
//        _ = observable.subscribe(onNext: {
//            print($0)
//        })
        //////////////////////////////////////////////////////////////////
        
    }
    
}
