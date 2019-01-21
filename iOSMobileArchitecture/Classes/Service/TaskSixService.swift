//
//  TaskSixService.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 22/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import RxSwift

class TaskSixService {
    // Создать последовательность, которая эмитит рандомное число в диапазоне от -100 до 100. Observable cold. Если число больше 0, последовательность дальше по цепочке передает строку "Успех", иначе "Провал". Если число попадает в диапазон от 10 до 20 - последовательность завершается ошибкой.
    
    static func generate() -> Observable<String> {
        return Observable.create({ observer in
            let randomInt = Int.random(in: -100..<100)
            
            //observer.onError(Problem())
            
            if randomInt > 0 {
                observer.onNext("Успех")
            } else {
                observer.onNext("Провал")
            }
            
            if randomInt >= 10 && randomInt <= 20 {
                observer.onError(Problem())
            }
            
            return Disposables.create()
        })
    }

}
