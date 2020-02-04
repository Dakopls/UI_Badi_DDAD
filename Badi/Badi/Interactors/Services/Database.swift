//
//  Database.swift
//  Badi
//
//  Created by user on 24/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import Foundation

class Database {
    private var locations = [Location]()
    private var rooms = [Room]()
    private var room_detail: RoomDetail?
    
    func storeLocations(content: Array<Location>) {
        locations = content
    }
    
    func storeRooms(content: Array<Room>) {
        rooms = content
    }
    
    func storeRoomDetail(content: RoomDetail) {
        room_detail = content
    }
    
    func getLocations() -> Array<Location> {
        return locations
    }
    
    func getRooms() -> Array<Room> {
        return rooms
    }
    
    func getRoomDetail() -> RoomDetail {
        return room_detail!
    }
    
}
