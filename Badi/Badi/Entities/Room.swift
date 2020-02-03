//
//  Room.swift
//  Badi
//
//  Created by user on 25/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

struct Room: Codable {
    
    var id: String
    var title: String
    var price: String
    var city: String
    var photos: Array<Photo>
    var owner: Owner
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = (try container.decode(String.self, forKey: .title)).uppercaseFirst
        self.price = String(Int(try container.decode(Double.self, forKey: .price)))+"€"
        self.city = (try container.decode(String.self, forKey: .city)).uppercaseFirst
        self.photos = try container.decode(Array<Photo>.self, forKey: .photos)
        self.owner = try container.decode(Owner.self, forKey: .owner)
    }
    
}
