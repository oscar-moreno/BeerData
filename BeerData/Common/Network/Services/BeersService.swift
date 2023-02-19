//
//  BeersService.swift
//  BeerData
//
//  Created by Óscar on 19/2/23.
//

import Foundation

protocol BeersServiceProtocol {
    func getBeers() async -> Result<BeerModel, RequestError>
}

struct BeersService: HTTPClient, BeersServiceProtocol {
    func getBeers() async -> Result<BeerModel, RequestError> {
        return await sendRequest(endpoint: BeersEndpoint.beers, responseModel: BeerModel.self)
    }
}
