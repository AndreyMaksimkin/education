//
//  TaskTwoService.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import RxSwift

class TaskTwoService {
    
    // Добавить метод создания последовательности, используя оператор timer. Последовательность должна выполняться в главном потоке.
    
    static func generateFromTimer() -> Observable<String> {
        
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
                observer.on(.next(String(next)))
                next += 1
            }
            timer.resume()
            
            return cancel
        }
    }
        
}
