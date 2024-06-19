//
//  Struct.swift
//  0619_weatherAPI
//
//  Created by 김성률 on 6/19/24.
//

import Foundation

struct Total: Decodable {
    
    let weather: [weatherImage]
    let main: Info
    let wind: windspeed
    let name: String
}
        
struct weatherImage: Decodable {
    
    let icon: String
    
}

struct Info: Decodable {
    
    let temp: Double
    let humidity: Int
    
}

struct windspeed: Decodable {
    
    let speed: Double
    
}


