//
//  BeerModel.swift
//  BeerData
//
//  Created by Óscar on 19/2/23.
//

import Foundation

typealias BeerModel = [BeerModelElement]

struct BeerModelElement: Codable, Equatable {
    let id: Int
    let name, tagline, description: String
    let imageURL: String
    let ingredients: Ingredients

    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case description
        case imageURL = "image_url"
        case ingredients
    }
}

// MARK: - Ingredients
struct Ingredients: Codable, Equatable {
    let malt: [Malt]
}

// MARK: - Malt
struct Malt: Codable, Equatable {
    let name: String
}

