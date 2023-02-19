//
//  BeersEndpoint.swift
//  BeerData
//
//  Created by Óscar on 19/2/23.
//

import Foundation

enum BeersEndpoint {
    case beers
}

extension BeersEndpoint: Endpoint {
    var path: String {
        switch self {
        case .beers:
            return Constants.Network.endpoint
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .beers:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .beers:
            return Constants.Network.header
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .beers:
            return nil
        }
    }
}
