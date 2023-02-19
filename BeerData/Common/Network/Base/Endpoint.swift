//
//  Endpoint.swift
//  BeerData
//
//  Created by Óscar on 19/2/23.
//

import Foundation

import Foundation

protocol Endpoint {
    var transferProtocol: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var transferProtocol: String {
        return Constants.Network.https
    }
    
    var host: String {
        return Constants.Network.apiHost
    }
}
