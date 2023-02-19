//
//  HomeViewModel.swift
//  BeerData
//
//  Created by Óscar on 19/2/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    var service: BeersServiceProtocol
    @Published var beers: BeerModel?
    
    init() {
        self.service = BeersService()
        saveBeers()
    }
    
    func fetchBeers(completion: @escaping (Result<BeerModel, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getBeers()
            completion(result)
        }
    }
    
    private func saveBeers() {
        fetchBeers { result in
            guard var unwrappedResult = try? result.get() else {return}
            unwrappedResult.sort(by: { $0.name < $1.name })
            if let encodedData = try? JSONEncoder().encode(unwrappedResult) {
                UserDefaults.standard.set(encodedData, forKey: "beers")
            }
        }
    }
    
    func getBeers() {
        if let data = UserDefaults.standard.object(forKey: "beers") as? Data,
           let userDefaultGoals = try? JSONDecoder().decode(BeerModel.self, from: data) {
            self.beers = userDefaultGoals
        }
    }
    
    func getIngredientsString(from ingredients: Ingredients) -> String {
        var ingredientsString = ""
        for ingredient in ingredients.malt {
            ingredientsString.append(" \(ingredient.name),")
        }
        return String(ingredientsString.dropLast())
    }
}
