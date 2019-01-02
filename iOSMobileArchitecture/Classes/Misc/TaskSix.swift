//
//  ObservableTypeExtension.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import RxSwift
import RxCocoa

extension ObservableType {
    
    // Реализовать статический метод, который создает последовательность. На вход методу передается значение (обобщенный тип), которое эмитит последовательность и затем завершается.
    
    static func generateElements() -> Observable<Int> {
        
        return Observable<Int>.create({ observer in
            observer.on(.next(3))
            observer.onCompleted()
            return Disposables.create()
        })
        
        //return Observable.just(1)
    }
}
