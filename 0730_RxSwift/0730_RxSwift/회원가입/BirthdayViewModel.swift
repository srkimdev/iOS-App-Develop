//
//  BirthdayViewModel.swift
//  0730_RxSwift
//
//  Created by 김성률 on 8/5/24.
//

import Foundation
import RxSwift
import RxCocoa

final class BirthdayViewModel {
    
    let disposeBag = DisposeBag()
    
    struct Input {
        let date: ControlProperty<Date>
        let tap: ControlEvent<Void>
    }
    
    struct Output {
        let year: BehaviorRelay<Int>
        let month: BehaviorRelay<Int>
        let day: BehaviorRelay<Int>
        let validation: Observable<Bool>
        let tap: ControlEvent<Void>
    }
    
    func transform(input: Input) -> Output {
        let year = BehaviorRelay(value: 0)
        let month = BehaviorRelay(value: 0)
        let day = BehaviorRelay(value: 0)
        let gap = BehaviorRelay(value: 0)
        
        input.date
            .bind(with: self) { owner, date in
                let component = Calendar.current.dateComponents([.day, .month, .year], from: date)
                
                year.accept(component.year!)
                month.accept(component.month!)
                day.accept(component.day!)
                
                gap.accept(owner.getGapFromToday(date: date))
            }
            .disposed(by: disposeBag)
        
        let validation = gap
            .map { $0 / 365 >= 17 }
        
        return Output(year: year, month: month, day: day, validation: validation, tap: input.tap)
    }
    
    func getGapFromToday(date: ControlProperty<Date>.Element) -> Int {
        let component = Calendar.current.dateComponents([.day, .month, .year], from: date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let today = dateFormatter.string(from: Date())
        
        guard let startDate = dateFormatter.date(from: "\(component.year!)-\(component.month!)-\(component.day!)"),
              let endDate = dateFormatter.date(from: today) else {
            return 0
        }

        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        
        return components.day!
    }
    
}
