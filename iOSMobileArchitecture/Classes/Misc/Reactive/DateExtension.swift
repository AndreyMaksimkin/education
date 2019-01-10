//
//  DateExtension.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Maksimkin on 05/01/2019.
//  Copyright © 2019 Andrey Chernyshev. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: NSDate {
    var current: Observable<NSDate> {
        return Observable.create { observer in
            
            observer.on(.next(NSDate()))
                    
            return Disposables.create()
        }
    }
}
