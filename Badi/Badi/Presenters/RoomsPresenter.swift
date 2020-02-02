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
    
    func fetchRooms(id: Int) {
        interactor?.fetchRooms(id: id)
    }

    func updateRooms(rooms: Array<Room>) {
        view?.populate(content: rooms)
    }

    func roomSelected(id: Int) {
        router?.pushDetail()
    }
    
    func backButtonPressed() {
        router?.returnSearch()
    }
    
}