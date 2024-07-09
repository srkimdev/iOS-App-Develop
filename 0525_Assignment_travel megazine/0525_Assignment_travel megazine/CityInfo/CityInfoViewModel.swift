//
//  CityInfoViewModel.swift
//  0525_Assignment_travel megazine
//
//  Created by 김성률 on 7/9/24.
//

import Foundation

class CityInfoViewModel {
    
    var list = CityInfo().city
    
    var inputFilter: Observable<Int?> = Observable(0)
    var outputFilter: Observable<[City]> = Observable([])
    
    init() {
        inputFilter.bind { _ in
            self.validate()
        }
    }
    
    private func validate() {
        
        var ex: [City] = []
        
        if inputFilter.value == 1 {
            
            for item in list {
                if item.domestic_travel {
                    ex.append(item)
                }
            }
            
            outputFilter.value = ex
            
        } else if inputFilter.value == 2 {
            
            for item in list {
                if item.domestic_travel == false {
                    ex.append(item)
                }
            }
            
            outputFilter.value = ex
            
        } else {
            outputFilter.value = list
        }
        
    }
    
}
