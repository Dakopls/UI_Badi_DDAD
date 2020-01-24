//
//  Presenter.swift
//  Badi
//
//  Created by user on 24/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

class Presenter {
    var view: SearchTableViewController?
    var interactor: Interactor?
    var router: Router?
    
    func fetchLocations(input: String) {
        interactor?.fetchLocations(input: input)
    }
    
    func updateLocations(locations: Array<Location>) {
        view?.populateLocations(locations: locations)
    }
}
