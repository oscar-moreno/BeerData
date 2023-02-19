//
//  HomeView.swift
//  BeerData
//
//  Created by Óscar on 19/2/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    @State var beerSearch = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List(beersFiltered, id: \.id) { beer in
                    NavigationLink {
                        BeerDetailView(name: beer.name, description: beer.description, imageUrl: beer.imageURL, ingredients: homeViewModel.getIngredientsString(from: beer.ingredients))
                    } label: {
                        VStack {
                            Text(beer.name)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .bold()
                            Text(beer.tagline).frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }.navigationTitle("Beers")
        }.task {
            homeViewModel.getBeers()
        }.searchable(text: $beerSearch, prompt: "Search beer...")
            .refreshable {
                homeViewModel.getBeers()
            }
    }
    
    var beersFiltered: BeerModel {
        if beerSearch.isEmpty {
            return homeViewModel.beers ?? BeerModel()
        } else {
            return homeViewModel.beers?.filter { $0.name.contains(beerSearch) || $0.tagline.contains(beerSearch)} ?? BeerModel()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
