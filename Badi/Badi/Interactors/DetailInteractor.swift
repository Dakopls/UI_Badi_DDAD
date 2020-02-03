//
//  DetailInteractor.swift
//  Badi
//
//  Created by user on 28/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import Foundation

class DetailInteractor {
    
    var id: String?
    var presenter: DetailPresenter?
    var database = Database()
    private let dataRetriever = URLDataRetriever()
    
    func fetchRoomDetail() {
        let url = "https://desolate-cove-97654.herokuapp.com/api/v1/rooms/"+id!
        //print(url)
        self.dataRetriever.retrieve(url: url, method: "GET") { (result: Result<RoomDetail, Error>) in
            switch result {
            case .success(let room):
                //el main thread és lliure ja que aquesta crida és asíncrona
                //només restringim al main thread la actualització de la tableView
                Thread.executeInMain {
                    self.database.storeRoomDetail(content: room)
                    self.updateRoomDetail()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateRoomDetail() {
        presenter?.updateRoomDetail(room_detail: database.getRoomDetail())
    }
    
}
