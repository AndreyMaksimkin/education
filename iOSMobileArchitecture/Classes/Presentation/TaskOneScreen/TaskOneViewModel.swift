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
    
    let subjectFirst = BehaviorSubject<String?>(value: nil)
    let subjectSecond = BehaviorSubject<String?>(value: nil)
    
    // Добавить метод, обращающийся к TaskOneService и возвращающий созданную в нем последовательность. На вход методу передавать параметры, полученные из сабжектов. Сабжекты должны быть включены в реактивную цепочку.
    
    func someMethod() -> Observable<Void> {
        
        return Observable
            .combineLatest(subjectFirst, subjectSecond)
            .flatMapLatest { first, second -> Observable<Void> in
                return TaskOneService.sendParameters(first!, second!)
        }
    }
    
}
