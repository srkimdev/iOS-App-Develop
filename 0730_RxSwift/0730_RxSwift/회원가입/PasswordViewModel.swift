//
//  PasswordViewModel.swift
//  0730_RxSwift
//
//  Created by 김성률 on 8/5/24.
//

import Foundation
import RxSwift
import RxCocoa

final class PasswordViewModel {
    
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
            .map { $0.count >= 8 }
        
        let validText = Observable.just("8자 이상 입력해주세요")
        
        return Output(validText: validText, validation: validation, tap: input.tap)
    }
    
}
