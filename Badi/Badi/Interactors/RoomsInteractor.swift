//
//  RoomsInteractor.swift
//  Badi
//
//  Created by user on 25/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import Foundation

class RoomsInteractor {
    
    var bounds: String?
    var presenter: RoomsPresenter?
    var database = Database()    
    private let dataRetriever = URLDataRetriever()
    
    func fetchRooms() {
        let url = "https://desolate-cove-97654.herokuapp.com/api/v1/rooms?bounds="+self.bounds!+"&page=1&size=10&sort=2"
        print(url)
        self.dataRetriever.retrieve(url: url, method: "GET") { (result: Result<Array<Room>, Error>) in
            switch result {
            case .success(let rooms):
                //el main thread és lliure ja que aquesta crida és asíncrona
                //només restringim al main thread la actualització de la tableView
                Thread.executeInMain {
                    self.database.storeRooms(content: rooms)
                    self.updateRooms()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateRooms() {
        presenter?.updateRooms(rooms: database.getRooms())
    }
    
}
