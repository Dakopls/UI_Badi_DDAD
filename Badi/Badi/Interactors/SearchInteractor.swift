//
//  Interactor.swift
//  Badi
//
//  Created by user on 24/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

class SearchInteractor {
    
    var presenter: SearchPresenter?
    var database = Database()
    //private let dataRetriever = URLSessionDataRetriever()
    
    func fetchLocations(input: String) {
        // < fake fetch
        var locations = [Location]()
        locations.append(Location(id: 1, name: "Gràcia", kind: "Neighbourhood"))
        locations.append(Location(id: 2, name: "Enric Granados", kind: "Street"))
        locations.append(Location(id: 3, name: "Granada", kind: "City"))
        // fake fetch >
        database.storeLocations(content: locations)
        updateLocations()
    }
    
    func updateLocations() {
        // se li ha de passar el contingut al presenter
        presenter?.updateLocations(locations: database.getLocations())
    }
    
}
