//
//  RoomsInteractor.swift
//  Badi
//
//  Created by user on 25/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import Foundation

class RoomsInteractor {
    
    var location: Location?
    var presenter: RoomsPresenter?
    var database = Database()    
    private let dataRetriever = URLDataRetriever()
    
    func fetchRooms() {
        let bounds = self.location?.boundingbox
        let parameter = "&order_type=price"
        let order = "&order=desc"
        let min = "&min=200"
        let max = "&max=600"
        let url1 = "https://desolate-cove-97654.herokuapp.com/api/v1/rooms?bounds="+bounds!
        let url2 = "&page=1&size=5"+parameter+order+min+max
        let url = url1 + url2
        //print(url)
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
    
    func getLocationName() -> String {
        return String((location?.display_name.getFirstWord)!.dropLast())
    }
    
    func updateRooms() {
        presenter?.updateRooms(rooms: database.getRooms())
    }
    
}
