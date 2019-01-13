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
       
        //cold - это когда Observable создает observer
        return Observable<Int>.create({ observer in
            let randomInt = Int.random(in: -100..<100)
            if randomInt > 0 {
                observer.onNext(randomInt)
                observer.onCompleted()
                return Disposables.create()
            } else {
                observer.onError(Problem())
                return Disposables.create()
            }
        })
        
//        if randomInt > 0 {
//            return Observable<Int>.create({ observer in
//
//            })
//        } else {
//            return Observable<Int>.create({ observer in
//                //все ошибки должны быть класса Problem
//                observer.onError(Problem())
//                return Disposables.create()
//            })
//        }
    }
}
