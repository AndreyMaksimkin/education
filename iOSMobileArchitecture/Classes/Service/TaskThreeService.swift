//
//  TaskThreeService.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import RxSwift
import RxCocoa

class TaskThreeService {
    
    // Заменить текущий вариант создания последовательности, используя метод create. Последовательность эмитит только ошибку.
    static func generateErrorByCreate() -> Observable<Int> {
        //будет ли вызван сигнал onCompleted?
        return Observable<Int>.create({ observer in
            observer.onError(RxError.unknown)
            observer.onCompleted()
            return Disposables.create()
        })
    }
    
    // Заменить текущий вариант создания последовательности, используя метод, который создает последовательность, завершающуюся ошибкой.
    static func generateError() -> Observable<Int> {
        
        return Observable<Int>.create({ observer in
            //onNext
            observer.on(.next(1))
            observer.on(.next(2))
            observer.onError(RxError.unknown)
            return Disposables.create()
        })
        
    }
}
