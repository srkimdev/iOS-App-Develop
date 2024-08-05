//
//  PhoneViewModel.swift
//  0730_RxSwift
//
//  Created by 김성률 on 8/5/24.
//

import Foundation
import RxSwift
import RxCocoa

final class PhoneViewModel {
    
    struct Input {
        let text: ControlProperty<String?>
        let tap: ControlEvent<Void>
    }
    
    struct Output {
        let validText: Observable<String>
        let validation: Observable<Bool>
        let tap: ControlEvent<Void>
    }
    
    func transform(input: Input) -> Output {
        let validation = input.text
            .orEmpty
            .map { text in
                text.count >= 10 && text.allSatisfy({ $0.isNumber })
            }
        
        let validText = BehaviorSubject(value: "010")
        
        return Output(validText: validText, validation: validation, tap: input.tap)
    }
    
}
