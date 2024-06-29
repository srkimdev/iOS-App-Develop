//
//  APIRequest.swift
//  0619_weatherAPI
//
//  Created by 김성률 on 6/29/24.
//

import Foundation

enum ErrorCase: Int, Error {
    case failedRequest = 401
    case noData = 403
    case invalidResponse
    case invalidData
}

class APIRequest {
    
    static let shared = APIRequest()
    
    private init() {}
    
    func callRequest(lat: Double, long: Double, completionHandler: @escaping (Total?, ErrorCase?) -> Void) {
        
        var component = URLComponents()
        component.scheme = "https"
        component.host = "api.openweathermap.org"
        component.path = "/data/2.5/weather"
        component.queryItems = [
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "lat", value: "\(lat)"),
            URLQueryItem(name: "lon", value: "\(long)"),
            URLQueryItem(name: "appid", value: APIkey.id),
        ]
        
        let request = URLRequest(url: component.url!, timeoutInterval: 5)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                
                guard error == nil else {
                    completionHandler(nil, .failedRequest)
                    return
                }
                
                guard let data = data else {
                    completionHandler(nil, .noData)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    
                    completionHandler(nil, .invalidResponse)
                    return
                }
                
                guard response.statusCode == 200 else {
                    completionHandler(nil, .failedRequest)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(Total.self, from: data)
                    completionHandler(result, nil)
                } catch {
                    completionHandler(nil, .invalidData)
                }
            }
            
        }.resume()
        
    }
    
}
