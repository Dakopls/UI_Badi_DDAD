//
//  Presenter.swift
//  Badi
//
//  Created by user on 24/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

class SearchPresenter {
    
    var view: SearchViewController?
    var interactor: SearchInteractor?
    var router: Router?
    
    func fetchLocations(input: String) {
        interactor?.fetchLocations(input: input)
    }
    
    func updateLocations(locations: Array<Location>) {
        view?.populate(content: locations)
    }
    
    func locationSelected(location: Location) {
        router?.pushRooms(location: location)
    }
    
    func cancelButtonPressed() {
        router?.returnHome()
    }
    
}
