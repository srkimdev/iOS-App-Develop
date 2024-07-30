//
//  ObservableExample.swift
//  0730_RxSwift
//
//  Created by 김성률 on 7/30/24.
//

import UIKit
import RxSwift
import RxCocoa

class ObservableExample: UIViewController {
    
    let itemsA = [3.3, 4.0, 5.0, 2.0, 3.6, 4.8]
    let itemsB = [2.3, 2.0, 1.3]
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        just()
        of()
        from()
        take()
    }
    
    func just() {
        Observable.just(itemsA)
            .subscribe { value in
                print("just - \(value)")
            } onError: { error in
                print(error)
            } onCompleted: {
                print("complete")
            } onDisposed: {
                print("dispose")
            }
            .disposed(by: disposeBag)
    }
    
    func of() {
        Observable.of(itemsA, itemsB)
            .subscribe { value in
                print("just - \(value)")
            } onError: { error in
                print(error)
            } onCompleted: {
                print("complete")
            } onDisposed: {
                print("dispose")
            }
            .disposed(by: disposeBag)
    }
    
    func from() {
        Observable.from(itemsA)
            .subscribe { value in
                print("just - \(value)")
            } onError: { error in
                print(error)
            } onCompleted: {
                print("complete")
            } onDisposed: {
                print("dispose")
            }
            .disposed(by: disposeBag)
    }
    
    func take() {
        Observable.repeatElement("go")
            .take(5)
            .subscribe { value in
                print("just - \(value)")
            } onError: { error in
                print(error)
            } onCompleted: {
                print("complete")
            } onDisposed: {
                print("dispose")
            }
            .disposed(by: disposeBag)
    }
    
    
}

