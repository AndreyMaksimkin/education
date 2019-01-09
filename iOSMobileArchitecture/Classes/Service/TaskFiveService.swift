//
//  TaskFiveService.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import RxSwift
import RxCocoa

class TaskFiveService {
    
    // Заменить текущий вариант создания последовательности, используя метод create. Последовательность пустая и просто завершается.
    static func completedByCreate() -> Observable<Void> {
        
        return Observable<Void>.create({ observer in
            observer.onCompleted()
            return Disposables.create()
        })
    }
    
    // Заменить текущий вариант создания последовательности, используя метод, создающий пустую последовательность, завершающуюся сигналом Completed.
    static func completed() -> Observable<Int> {
        return Observable.empty()
        
        //лишние отступы
    }
}
