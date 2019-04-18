//
//  TaskTwoViewModel.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 22/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import RxSwift

class TaskOneViewModel {
    // Добавить сабжект для хранения первого параметра
    // Добавить сабжект для хранения второго параметра
    
    private let subjectFirst = BehaviorSubject<String>(value: "param1")
    private let subjectSecond = BehaviorSubject<String>(value: "param2")
    
    // Добавить метод, обращающийся к TaskOneService и возвращающий созданную в нем последовательность. На вход методу передавать параметры, полученные из сабжектов. Сабжекты должны быть включены в реактивную цепочку.
    
    
    
    
    
//    init() {
//        //setup()
//    }
    
//    private func setup() {
//        let param1 = UserDefaults.standard.object(forKey: parameterFirst) as? String ?? ""
//        subjectFirst = BehaviorSubject(value: param1)
//
//
//        let param2 = UserDefaults.standard.object(forKey: parameterSecond) as? String ?? ""
//        subjectSecond = BehaviorSubject(value: param2)
//
//
//
//
//        subjectFirst.subscribe { (event) in
//            print("первый подписчик \(event)")
//        }
//
//
//    }
    
    private func someMethod(param1: String, param2: String) -> Observable<Void> {
        return TaskOneService.sendParameters(param1, param2)
    }
    
}
