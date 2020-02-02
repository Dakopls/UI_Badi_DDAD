//
//  Interactor.swift
//  Badi
//
//  Created by user on 24/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import Foundation

class SearchInteractor {
    
    var presenter: SearchPresenter?
    var database = Database()
    private let dataRetriever = URLDataRetriever()
    
    func fetchLocations(input: String) {
        let clean = input.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        let url = "https://desolate-cove-97654.herokuapp.com/api/v1/locations?keyword="+clean
        self.dataRetriever.retrieve(url: url, method: "GET") { (result: Result<Array<Location>, Error>) in
            switch result {
            case .success(let locations):
                //el main thread és lliure ja que aquesta crida és asíncrona
                //només restringim al main thread la actualització de la tableView
                Thread.executeInMain {
                    self.database.storeLocations(content: locations)
                    self.updateLocations()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateLocations() {
        // se li ha de passar el contingut al presenter
        presenter?.updateLocations(locations: database.getLocations())
    }
    
}
