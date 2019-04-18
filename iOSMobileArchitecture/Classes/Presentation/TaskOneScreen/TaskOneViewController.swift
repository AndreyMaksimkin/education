//
//  TaskOneViewController.swift
//  iOSMobileArchitecture
//
//  Created by Andrey Chernyshev on 21/11/2018.
//  Copyright © 2018 Andrey Chernyshev. All rights reserved.
//

import UIKit
import RxSwift

class TaskOneViewController: UIViewController {
    @IBOutlet weak var parameterOneTextField: UITextField!
    @IBOutlet weak var parameterTwoTextField: UITextField!
    @IBOutlet weak var requestButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // По тапу на кнопку requestButton (применить rx) реализовать подписку на последовательность, созданную в TaskOneService, используя метод из TaskOneViewModel. Если последовательность завершается ошибкой, в resultLabel отображать строку "Ошибка", иначе "Успешно".
        
//        requestButton.rx.tap
//            .subscribe() { event in
//                TaskOneViewModel().
//        }
//        .disposed(by: disposeBag)
        
    }
}
