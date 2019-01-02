//
//  TaskOne.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import RxSwift
import RxCocoa

class TaskOneService {
    
    // Заменить текущий вариант создания последовательности, используя метод create. Последовательность эмитит сигнал с числом, затем завершается. Число рандомное, observable hot.
    static func generateRandom() -> Observable<Int> {
        
        return Observable<Int>.create({ observer in
            observer.on(.next(3))
            observer.onCompleted()
            return Disposables.create()
        })
        
        //return Observable.just(1)
    }
}
