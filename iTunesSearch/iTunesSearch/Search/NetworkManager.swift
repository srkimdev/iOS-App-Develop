//
//  NetworkManager.swift
//  iTunesSearch
//
//  Created by 김성률 on 8/8/24.
//

import Foundation
import RxSwift
import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    func callRequest(appName: String) -> Observable<iTunes> {
        
        let url = "https://itunes.apple.com/search?term=\(appName)&entity=software&country=KR&limit=10"
        
        let result = Observable<iTunes>.create { observer in
            guard let url = URL(string: url) else {
                return Disposables.create()
            }
            
            print("com")
            AF.request(url).responseDecodable(of: iTunes.self) { response in
                
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    print(error)
                }
            }
            
            return Disposables.create()
        }
        
        return result
    }
    
}
