//
//  TaskThreeService.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import RxSwift

class TaskThreeService {
    
    // Добавить метод (не статический), создающий последовательность, используя оператор timer. Последовательность должна выполняться на главном потоке. Период задать 1.
    
    func generateFromTimer() -> Observable<Int> {
        
        return Observable.create { observer in
            print("Subscribed")
            let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.main)
            timer.schedule(deadline: DispatchTime.now(), repeating: 1)
            
            let cancel = Disposables.create {
                print("Disposed")
                timer.cancel()
            }
            
            var next = 0
            timer.setEventHandler {
                if cancel.isDisposed {
                    return
                }
                observer.on(.next(next))
                next += 1
            }
            timer.resume()
            
            return cancel
        }
    }
}
