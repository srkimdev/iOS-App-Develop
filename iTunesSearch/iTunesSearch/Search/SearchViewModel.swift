//
//  SearchViewModel.swift
//  iTunesSearch
//
//  Created by 김성률 on 8/8/24.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchViewModel {
    
    let disposeBag = DisposeBag()
    
    struct Input {
        let searchButtonTap: ControlEvent<Void>
        let searchText: ControlProperty<String>
    }
    
    struct Output {
        let appList: Observable<[Apps]>
    }
    
    func transform(input: Input) -> Output {
        
        let appList = PublishSubject<[Apps]>()
        
        input.searchButtonTap
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .withLatestFrom(input.searchText)
            .distinctUntilChanged()
            .map { "\($0)" }
            .flatMap { value in
                NetworkManager.shared.callRequest(appName: value)
            }
            .subscribe(with: self, onNext: { owner, value in
                appList.onNext(value.results)
            })
            .disposed(by: disposeBag)
        
        return Output(appList: appList)
    }
    
}
