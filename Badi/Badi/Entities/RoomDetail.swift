//
//  RoomDetail.swift
//  Badi
//
//  Created by user on 03/02/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

struct RoomDetail: Codable {
    
    var id: String
    var title: String
    var description: String
    var price: String
    var lat: String
    var lng: String
    var city: String
    var room_size: Int
    var flat_size: Int
    var photos: Array<Photo>
    var owner: Owner
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = (try container.decode(String.self, forKey: .title)).uppercaseFirst
        self.description = try container.decode(String.self, forKey: .description)
        self.price = String(Int(try container.decode(Double.self, forKey: .price)))+"€"
        self.lat = try container.decode(String.self, forKey: .lat)
        self.lng = try container.decode(String.self, forKey: .lng)
        self.city = (try container.decode(String.self, forKey: .city)).uppercaseFirst
        self.room_size = try container.decode(Int.self, forKey: .room_size)
        self.flat_size = try container.decode(Int.self, forKey: .flat_size)
        self.photos = try container.decode(Array<Photo>.self, forKey: .photos)
        self.owner = try container.decode(Owner.self, forKey: .owner)
    }
    
}
