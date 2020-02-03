//
//  DetailPresenter.swift
//  Badi
//
//  Created by user on 28/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import Foundation

class DetailPresenter {
    
    var view: DetailViewController?
    var interactor: DetailInteractor?
    var router: Router?
    
    func fetchRoomDetail() {
        interactor?.fetchRoomDetail()
    }
    
    func backButtonPressed() {
        router?.returnRooms()
    }
    
    func updateRoomDetail(room_detail: RoomDetail) {
        view?.populate(content: room_detail)
    }
//    func searchSelected() {
//        router?.pushSearch()
//    }
    
}
