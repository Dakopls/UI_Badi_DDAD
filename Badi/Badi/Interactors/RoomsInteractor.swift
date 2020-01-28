//
//  RoomsInteractor.swift
//  Badi
//
//  Created by user on 25/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//


class RoomsInteractor {
    
    var presenter: RoomsPresenter?
    var database = Database()    
    //private let dataRetriever = URLSessionDataRetriever()
    
    func fetchRooms(id: Int) {
        // < fake fetch
        var rooms = [Room]()
        rooms.append(Room(id: 1, name: "Room 1", price: 450))
        rooms.append(Room(id: 2, name: "Room 2", price: 400))
        rooms.append(Room(id: 3, name: "Room 3", price: 250))
        // fake fetch >
        database.storeRooms(content: rooms)
        updateRooms()
    }
    
    func updateRooms() {
        presenter?.updateRooms(rooms: database.getRooms())
    }
    
}
