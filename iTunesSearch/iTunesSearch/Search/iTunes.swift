//
//  iTunes.swift
//  iTunesSearch
//
//  Created by 김성률 on 8/8/24.
//

import Foundation

struct iTunes: Decodable {
    let results: [Apps]
}

struct Apps: Decodable {
    let screenshotUrls: [String]
    let artworkUrl100: String
    let trackName: String
}
