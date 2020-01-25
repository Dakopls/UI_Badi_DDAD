//
//  Interactor.swift
//  Badi
//
//  Created by user on 24/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

class Interactor {
    var presenter: Presenter?
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
