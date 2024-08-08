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
    
    // collectionView
    let todolist = BehaviorRelay(value: [
        todo(check: false, chore: "그립톡 구매하기", star: false),
        todo(check: false, chore: "사이다 구매", star: false),
        todo(check: false, chore: "아이패드 케이스 최저가 알아보기", star: false),
        todo(check: false, chore: "양말", star: false)
    ])
    
    private var tableList: [todo] = []
    
    let disposeBag = DisposeBag()
    
    struct Input {
        let addButtonTap: ControlEvent<Void>
        let newTodoText: ControlProperty<String?>
        let starButtonTap: PublishRelay<Int>
        let checkButtonTap: PublishRelay<Int>
        
        let tabCell: PublishSubject<todo>
    }
    
    struct Output {
        let todoList: BehaviorRelay<[todo]>
        let tableList: BehaviorSubject<[todo]>
    }
    
    func transform(input: Input) -> Output {
        
        let tableList = BehaviorSubject(value: tableList)
        
        input.tabCell
            .subscribe(with: self) { owner, value in
                owner.tableList.append(value)
                tableList.onNext(owner.tableList)
            }
            .disposed(by: disposeBag)
        
        input.starButtonTap
            .bind(with: self) { owner, value in
                owner.tableList[value].star.toggle()
                tableList.onNext(owner.tableList)
            }
            .disposed(by: disposeBag)
        
        input.checkButtonTap
            .bind(with: self) { owner, value in
                owner.tableList[value].check.toggle()
                tableList.onNext(owner.tableList)
            }
            .disposed(by: disposeBag)
        
        input.addButtonTap
            .withLatestFrom(input.newTodoText.orEmpty)
            .bind(with: self) { owner, value in
                let newTodo = todo(check: false, chore: value, star: false)
                var currentList = owner.todolist.value
                currentList.append(newTodo)
                owner.todolist.accept(currentList)
            }
            .disposed(by: disposeBag)
        
            
        return Output(todoList: todolist, tableList: tableList)
    }
    
}
