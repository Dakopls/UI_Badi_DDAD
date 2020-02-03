//
//  RoomsPresenter.swift
//  Badi
//
//  Created by user on 25/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

class RoomsPresenter {
    
    var view: RoomsViewController?
    var interactor: RoomsInteractor?
    var router: Router?
    
    func fetchRooms() {
        interactor?.fetchRooms()
    }

    func updateRooms(rooms: Array<Room>) {
        view?.populate(content: rooms)
    }

    func roomSelected(id: String) {
        router?.pushDetail(id: id)
    }
    
    func backButtonPressed() {
        router?.returnSearch()
    }
    
}
