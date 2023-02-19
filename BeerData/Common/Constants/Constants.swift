//
//  Constants.swift
//  BeerData
//
//  Created by Óscar on 19/2/23.
//

import Foundation

struct Constants {
    struct Network {
        static let https = "https"
        static let apiHost = "api.punkapi.com"
        static let endpoint = "/v2/beers"
        static let header = ["Content-Type":"application/json;charset=utf-8"]
    }
}
