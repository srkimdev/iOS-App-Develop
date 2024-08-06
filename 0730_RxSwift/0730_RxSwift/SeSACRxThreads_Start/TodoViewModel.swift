//
//  TodoViewModel.swift
//  0730_RxSwift
//
//  Created by 김성률 on 8/5/24.
//

import Foundation
import RxSwift
import RxCocoa

struct todo {
    var check: Bool
    let chore: String
    var star: Bool
}

final class TodoViewModel {
    
    let list = BehaviorRelay(value: [
        todo(check: false, chore: "그립톡 구매하기", star: false),
        todo(check: false, chore: "사이다 구매", star: false),
        todo(check: false, chore: "아이패드 케이스 최저가 알아보기", star: false),
        todo(check: false, chore: "양말", star: false)
    ])
    
    let disposeBag = DisposeBag()
    
    struct Input {
        let addButtonTap: ControlEvent<Void>
        let newTodoText: ControlProperty<String?>
        let starButtonTap: PublishRelay<Int>
        let checkButtonTap: PublishRelay<Int>
    }
    
    struct Output {
        let todoList: BehaviorRelay<[todo]>
    }
    
    func transform(input: Input) -> Output {
        input.starButtonTap
            .bind(with: self) { owner, value in
                var currentList = owner.list.value
                currentList[value].star.toggle()
                owner.list.accept(currentList)
            }
            .disposed(by: disposeBag)
        
        input.checkButtonTap
            .bind(with: self) { owner, value in
                var currentList = owner.list.value
                currentList[value].check.toggle()
                owner.list.accept(currentList)
            }
            .disposed(by: disposeBag)
        
        input.addButtonTap
            .withLatestFrom(input.newTodoText.orEmpty)
            .bind(with: self) { owner, value in
                let newTodo = todo(check: false, chore: value, star: false)
                var currentList = owner.list.value
                currentList.append(newTodo)
                owner.list.accept(currentList)
            }
            .disposed(by: disposeBag)
        
            
        return Output(todoList: list)
    }
    
}
