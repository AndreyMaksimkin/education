//
//  TaskOne.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import UIKit
import RxSwift

let parameterFirst = "parameterFirst"
let parameterSecond = "paramenterSecond"

class TaskOneService: RestAPI {
    
    // Добавить метод, принимающий на вход 2 параметра типа String. Требуется сначала сохранить в UserDefaults оба параметра, затем выполнить запрос (имитация) TaskOneRequest, используя метод RestAPI. Результат запроса преобразовать к Int?, которое либо сохраняется в UserDefaults, если он не nil, либо последовательность завершается ошибкой. Метод возвращает Observable<Void>.
    
    func sendParameters(first: String, second: String) -> Observable<Void> {
        
        UserDefaults.standard.set(first, forKey: parameterFirst)
        UserDefaults.standard.set(second, forKey: parameterSecond)
        UserDefaults.standard.synchronize()
        
         //прочитать про flatMap
        
        let request = TaskOneRequest.init(parameterOne: first, parameterTwo: second)
        let observable = TaskOneRequest.request(with: request)
        
        
       
        

    }
    
    
}
