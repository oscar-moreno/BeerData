//
//  BeersServiceMock.swift
//  BeerDataTests
//
//  Created by Óscar on 19/2/23.
//

import Foundation
@testable import BeerData

class BeersServiceMock: BeersServiceProtocol {
    func getBeers() async -> Result<BeerData.BeerModel, BeerData.RequestError> {
        var beers = BeerData.BeerModel()
        beers.append(BeerModelElement(id: 1, name: "Fake Beer", tagline: "Fake beer 1 tagline", description: "Fake beer 1 tagline", imageURL: "https://images.punkapi.com/v2/keg.png", ingredients: Ingredients(malt: [Malt(name: "Caramal"), Malt(name: "Munich")])))
        return .success(beers)
    }
}
