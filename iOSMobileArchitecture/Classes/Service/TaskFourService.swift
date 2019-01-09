//
//  TaskFourService.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import RxSwift
import RxCocoa

class TaskFourService {
    
    // Заменить текущий вариант создания последовательности, используя метод create. Генерируется рандомное число в диапазоне от -100 до 100. Если число положительное, последовательность эмитит это число и завершается, иначе просто завершается ошибкой.
    static func generate() -> Observable<Int> {
        //сделай cold observable
        let randomInt = Int.random(in: -100..<100)
        
        if randomInt > 0 {
            return Observable<Int>.create({ observer in
                observer.on(.next(randomInt))
                observer.onCompleted()
                return Disposables.create()
            })
        } else {
            return Observable<Int>.create({ observer in
                //все ошибки должны быть класса Problem
                observer.onError(RxError.unknown)
                observer.onCompleted()
                return Disposables.create()
            })
        }
    }
}
